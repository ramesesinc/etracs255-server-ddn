[getPublication]
select 
	rl.objid as ledgerid,
	rl.tdno,
	rl.fullpin,
	rl.cadastrallotno,
	rl.titleno,
	rl.blockno,
	rl.classcode,
	pc.name as classification, 
	f.owner_name,
	f.owner_address,
	b.name as barangay,
	o.name as lgu, 
	rl.totalareaha,
	rl.totalareaha * 10000 as totalareasqm, 
	rl.totalmv,
	rl.totalav, 
	n.objid as noticeid, 
	n.period,
	n.basic,
	n.basicint,
	n.basicdisc,
	n.sef,
	n.sefint,
	n.sefdisc,
	n.basicidle,
	n.basicidleint,
	n.basicidledisc,
	n.firecode,
	a.costofsale,
	n.amtdue
from propertyauction a
inner join propertyauction_publication p on a.objid = p.parent_objid
inner join propertyauction_notice n on p.notice_objid = n.objid 
inner join rptledger rl on n.rptledger_objid = rl.objid 
inner join barangay b on rl.barangayid = b.objid 
inner join faas f on rl.faasid = f.objid 
inner join sys_org o on f.lguid = o.objid
inner join propertyclassification pc on rl.classification_objid = pc.objid 
where ${filter}
order by o.code, b.pin, rl.tdno 