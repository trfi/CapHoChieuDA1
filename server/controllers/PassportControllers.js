const {Passport} = require('../models')
const {Resident} = require('../models')
const {Archive} = require('../models')
const Op = require('sequelize').Op

const updateStatus = async (id, status) => {
  return await Passport.update({
    trangthai: status},
    {where: {id: id}}
  )
}

const paginate = ({ page, perPage }) => {
  const offset = (page * perPage) - perPage;
  const limit = perPage;
  return {
    offset,
    limit,
  }
}

module.exports = {
  async createNew(req, res, next) {
    Passport.create(req.body)
    .then(passport =>
      res.json({ passport, msg: 'Passport account created successfully' })
    )
  },
  async view(req, res, next) {
    try {
      const perPage = req.body.perPage ? parseInt(req.body.perPage) : 5
      const page = req.body.page ? parseInt(req.body.page) : 1
      const whereObj =  req.body.status ? {
        trangthai: {
          [Op.like]: `${req.body.status}%`
        }
      } : {}
      const {count, rows} = await Passport.findAndCountAll({
        where: whereObj,
        order: [
          ['created_at', 'ASC'],
        ],
        ...paginate({ page, perPage }),
      })
      res.send({page, data: rows, total: Math.ceil((count/perPage))})
    }
    catch (err) {
      next(err)
    }
  },
  async viewByStatus(req, res) {
    const { status } = req.params;
    Passport.findAll({
      where: {
        trangthai: {
          [Op.like]: status + '%'
        }
      }
    }).then(passports =>
      res.json(passports)
    )
  },
  async authenticate(req, res, next) {
    try {
      const {id} = req.params;
      const passport = await Passport.findOne({
        where: { id: id }
      })
      const info = { hoten: passport.hoten, noisinh: passport.noisinh, ngaysinh: passport.ngaysinh, cmnd: passport.cmnd, dcthuongtru: passport.dcthuongtru, quanhuyen: passport.quanhuyen };

      console.log(info)

      const resident = await Resident.findOne({
        where: info
      })

      if (!resident) {
        updateStatus(id, 'xt canceled')
        return res.status(201).send({
          isAuthenticate: false
        })
      }
      updateStatus(id, 'xd waiting')
      return res.send({
        isAuthenticate: true
      })
    }
    catch (err) {
      console.log(err)
      res.status(500).send({
        error: 'An error has occured trying to authenticate'
      })
    }
  },
  async approve(req, res, next) {
    try {
      const {id} = req.params
      const {status} = req.body
      updateStatus(id, status)
      return res.send({
        status: 'success'
      })
    }
    catch (err) {
      console.log(err)
      res.status(500).send({
        error: 'An error has occured trying to approve'
      })
    }
  },
  async archive(req, res, next) {
    try {
      console.log(req.body)
      const {id} = req.params
      const {isArchive, status} = req.body
      if (isArchive) {
        Archive.create({passport_id: id})
        .then(() =>
          res.json({ status: 'success', msg: 'Archive successfully' })
        )
        updateStatus(id, status)
      }
      else {
        Passport.destroy({
          where: { id: id }
        })
        .then(() =>
          res.json({ status: 'success', msg: 'Delete passport successfully' })
        )
      }
    }
    catch (err) {
      console.log(err)
      res.status(500).send({
        error: 'An error has occured trying to approve'
      })
    }
  },
  async lookup(req, res) {
    const { lookupInfo } = req.body;
    Passport.findOne({
      attributes: ['id', 'trangthai', 'hoten', 'cmnd'],
      where: {
        [Op.or]: [
          { id: lookupInfo },
          { cmnd: lookupInfo }
        ]
      }
    }).then(passports =>
      res.json(passports)
    )
  },
}