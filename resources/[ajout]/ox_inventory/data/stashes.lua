---wip types

---@class OxStash
---@field name string
---@field label string
---@field owner? boolean | string | number
---@field slots number
---@field weight number
---@field groups? string | string[] | table<string, number> }
---@field blip? { id: number, colour: number, scale: number }
---@field coords? vector3
---@field target? { loc: vector3, length: number, width: number, heading: number, minZ: number, maxZ: number, distance: number, debug?: boolean, drawSprite?: boolean }

return {
	{
		coords = vec3(452.3, -991.4, 30.7),
		target = {
			loc = vec3(451.25, -994.28, 30.69),
			length = 1.2,
			width = 5.6,
			heading = 0,
			minZ = 29.49,
			maxZ = 32.09,
			label = 'Open personal locker'
		},
		name = 'policelocker',
		label = 'Personal locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = shared.police
	},

	{
		coords = vec3(301.3, -600.23, 43.28),
		target = {
			loc = vec3(301.82, -600.99, 43.29),
			length = 0.6,
			width = 1.8,
			heading = 340,
			minZ = 43.34,
			maxZ = 44.74,
			label = 'Open personal locker'
		},
		name = 'emslocker',
		label = 'Personal Locker',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['ambulance'] = 0}
	},

	{
		coords = vec3(237.31, -1360.42, 39.54),
		target = {
			loc = vec3(237.31, -1360.42, 39.54),
			length = 7.0,
			width = 2.8,
			heading = 320,
            minZ=33.34,
            maxZ=41.74,
			label = 'Coffre Patron'
		},
		name = 'emspatronlocker',
		label = 'Coffre Patron',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['ambulance'] = 3}
	},

	{
		coords = vec3(270.84, -1363.89, 24.54),
		target = {
			loc = vec3(270.84, -1363.89, 24.54),
			length = 2.4,
			width = 1.2,
			heading = 320,
          minZ=23.54,
          maxZ=25.54,
			label = 'Coffre personnel'
		},
		name = 'emspersonnellocker',
		label = 'Coffre personnel',
		owner = true,
		slots = 30,
		weight = 70000,
		groups = {['ambulance'] = 0}
	},

	{
		coords = vec3(902.35, -153.59, 82.5),
		target = {
			loc = vec3(902.35, -153.59, 82.5),
			length = 3.2,
			width = 1.0,
			heading = 329,
            minZ=81.45,
            maxZ=82.45,
			label = 'Coffre Taxi'
		},
		name = 'taxilocker',
		label = 'Coffre Taxi',
		owner = true,
		slots = 70,
		weight = 70000,
		groups = {['taxi'] = 4}
	},
}
