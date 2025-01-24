-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("crafting",cRP)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRAFTLIST
-----------------------------------------------------------------------------------------------------------------------------------------
local craftList = {
	["Ammos"] = {
		["perm"] = "Ammos",
		["list"] = {
			["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3
				}
			},
			["WEAPON_RIFLE_AMMO"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3
				}
			},
			["WEAPON_SHOTGUN_AMMO"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3
				}
			},
		}
	},
	["Ammos2"] = {
		["perm"] = "Ammos2",
		["list"] = {
			["WEAPON_PISTOL_AMMO"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3
				}
			},
			["WEAPON_RIFLE_AMMO"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3
				}
			},
			["WEAPON_SMG_AMMO"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3
				}
			},
			["WEAPON_SHOTGUN_AMMO"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3
				}
			},
		}
	},
	["Lixeiro"] = {
		["list"] = {
			["glass"] = {
				["amount"] = 3,
				["destroy"] = false,
				["require"] = {
					["glassbottle"] = 1
				}
			},
			["plastic"] = {
				["amount"] = 3,
				["destroy"] = false,
				["require"] = {
					["plasticbottle"] = 1
				}
			},
			["rubber"] = {
				["amount"] = 3,
				["destroy"] = false,
				["require"] = {
					["elastic"] = 1
				}
			},
			["aluminum"] = {
				["amount"] = 3,
				["destroy"] = false,
				["require"] = {
					["metalcan"] = 1
				}
			},
			["copper"] = {
				["amount"] = 3,
				["destroy"] = false,
				["require"] = {
					["battery"] = 1
				}
			}
		}
	},
	["Lester"] = {
		["list"] = {
			["blocksignal"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 3,
					["tarp"] = 1,
					["plastic"] = 6
				}
			},
			["weedclone"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["dollarsroll"] = 50
				}
			},
		}
	},
	["Mercado"] = {
		["list"] = {
			["keyboard"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["plastic"] = 4,
					["rubber"] = 2
				}
			},
			["mouse"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["plastic"] = 4,
					["rubber"] = 2
				}
			},
			["playstation"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 2,
					["copper"] = 2,
					["plastic"] = 3,
					["glass"] = 3
				}
			},
			["xbox"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 2,
					["copper"] = 2,
					["plastic"] = 3,
					["glass"] = 3
				}
			},
			["pan"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 2,
					["copper"] = 2,
					["rubber"] = 2,
					["plastic"] = 3,
					["glass"] = 3
				}
			},
			["fan"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["rubber"] = 2,
					["plastic"] = 4
				}
			},
			["blender"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["rubber"] = 2,
					["plastic"] = 4
				}
			},
			["switch"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["plastic"] = 3
				}
			},
			["cup"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 2,
					["copper"] = 2,
					["rubber"] = 2,
					["plastic"] = 3,
					["glass"] = 3
				}
			},
			["lampshade"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 2,
					["copper"] = 2,
					["rubber"] = 2,
					["plastic"] = 2,
					["glass"] = 2
				}
			},
			["silverring"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["silvercoin"] = 4,
					["copper"] = 2,
					["glass"] = 3
				}
			},
			["goldring"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["goldcoin"] = 4,
					["copper"] = 2,
					["rubber"] = 2,
					["plastic"] = 3,
					["glass"] = 3
				}
			},
			["watch"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["goldcoin"] = 4,
					["copper"] = 2,
					["rubber"] = 2,
					["plastic"] = 3,
					["glass"] = 3
				}
			},
			["bracelet"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["goldcoin"] = 4,
					["copper"] = 2,
					["rubber"] = 2,
					["plastic"] = 3,
					["glass"] = 3
				}
			},
			["dildo"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["rubber"] = 2,
					["plastic"] = 4
				}
			},
			["spray01"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 3,
					["rubber"] = 2,
					["plastic"] = 4
				}
			},
			["spray02"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 3,
					["rubber"] = 2,
					["plastic"] = 4
				}
			},
			["spray03"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 3,
					["rubber"] = 2,
					["plastic"] = 4
				}
			},
			["spray04"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 3,
					["rubber"] = 2,
					["plastic"] = 4
				}
			},
			["slipper"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["rubber"] = 6
				}
			},
			["rimel"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["rubber"] = 2,
					["plastic"] = 4
				}
			},
			["brush"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["rubber"] = 2,
					["plastic"] = 4
				}
			},
			["soap"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["rubber"] = 2,
					["plastic"] = 3
				}
			},
			["eraser"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["rubber"] = 2,
					["plastic"] = 4
				}
			},
			["legos"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["rubber"] = 2,
					["plastic"] = 8
				}
			},
			["ominitrix"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["rubber"] = 2,
					["plastic"] = 8
				}
			},
			["dices"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["plastic"] = 4
				}
			},
			["domino"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["plastic"] = 5
				}
			},
			["floppy"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 2,
					["plastic"] = 5
				}
			},
			["horseshoe"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 3,
					["rubber"] = 2,
					["plastic"] = 4
				}
			},
			["deck"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["rubber"] = 2,
					["plastic"] = 3
				}
			},
			["pliers"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["copper"] = 3,
					["rubber"] = 2,
					["plastic"] = 3
				}
			}
		}
	},
	["PizzaThis"] = {
		["list"] = {
			["pizzamozzarella"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["cheese"] = 1,
					["bread"] = 1,
					["ketchup"] = 1
				}
			},
			["pizzamushroom"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["cheese"] = 1,
					["bread"] = 1,
					["ketchup"] = 1,
					["mushroom"] = 3
				}
			},
			["pizzabanana"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["cheese"] = 1,
					["bread"] = 1,
					["banana"] = 6
				}
			},
			["pizzachocolate"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["cheese"] = 1,
					["bread"] = 1,
					["chocolate"] = 2
				}
			},
			["mushroomtea"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["mushroom"] = 20,
					["water"] = 1
				}
			}
		}
	},
	["BurgerShot"] = {
		["list"] = {
			["hamburger2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["meat"] = 1,
					["bread"] = 1,
					["cheese"] = 1,
					["ketchup"] = 1,
					["animalfat"] = 2
				}
			},
			["guarananatural"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 1,
					["guarana"] = 5
				}
			},
			["orangejuice"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 1,
					["orange"] = 5
				}
			},
			["tangejuice"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 1,
					["tange"] = 5
				}
			},
			["grapejuice"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 1,
					["grape"] = 5
				}
			},
			["strawberryjuice"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 1,
					["strawberry"] = 5
				}
			},
			["bananajuice"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 1,
					["banana"] = 5
				}
			},
			["acerolajuice"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 1,
					["acerola"] = 5
				}
			},
			["passionjuice"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["water"] = 1,
					["passion"] = 5
				}
			},
			["mushroomtea"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["mushroom"] = 20,
					["water"] = 1
				}
			}
		}
	},
	["UwuCoffee"] = {
		["list"] = {
			["nigirizushi"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["fishfillet"] = 1,
					["bread"] = 1
				}
			},
			["sushi"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["fishfillet"] = 1,
					["bread"] = 1
				}
			},
			["cupcake"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["chocolate"] = 1,
					["bread"] = 1,
					["milkbottle"] = 1
				}
			},
			["applelove"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["apple"] = 1,
					["sugar"] = 5,
					["water"] = 1
				}
			},
			["milkshake"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["chocolate"] = 2,
					["milkbottle"] = 2
				}
			},
			["cappuccino"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["chocolate"] = 2,
					["milkbottle"] = 2,
					["coffee2"] = 5
				}
			},
			["mushroomtea"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["mushroom"] = 20,
					["water"] = 1
				}
			}
		}
	},
	["BeanMachine"] = {
		["perm"] = "Desserts",
		["list"] = {
			["coffeemilk"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["coffee"] = 1,
					["milkbottle"] = 1
				}
			},
			["mushroomtea"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["mushroom"] = 20,
					["water"] = 1
				}
			}
		}
	},
	["Ballas"] = {
		["perm"] = "Ballas",
		["list"] = {
            ["handcuff"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                	["aluminum"] = 50,
					["elastic"] = 15
                }
            },
			["vest"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                	["sheetmetal"] = 10,
					["elastic"] = 15
                }
            },
            ["tablecoke"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                    ["woodlog"] = 20,
                    ["rubber"] = 15,
                    ["glass"] = 25,
                    ["aluminum"] = 10,
                }
            }
        }
    },
	["Families"] = {
		["perm"] = "Families",
		["list"] = {
            ["hood"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
					["elastic"] = 15
                }
            },
            ["tableweed"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                    ["woodlog"] = 20,
                    ["rubber"] = 15,
                    ["glass"] = 25,
                    ["aluminum"] = 10,
                }
            }
        }
    },
	["Vagos"] = {
		["perm"] = "Vagos",
		["list"] = {
            ["handcuff"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                	["aluminum"] = 50,
					["elastic"] = 15
                }
            },
            ["tablemeth"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                    ["woodlog"] = 20,
                    ["rubber"] = 15,
                    ["glass"] = 25,
                    ["aluminum"] = 10,
                }
            }
        }
    },
	["Aztecas"] = {
		["perm"] = "Aztecas",
		["list"] = {
			["c4"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 1,
					["explosives"] = 5,
					["sheetmetal"] = 1,
					["pliers"] = 1
				}
			},
			["attachsCrosshair"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 10,
					["roadsigns"] = 4,
					["sheetmetal"] = 3
				}
			},
			["dismantle"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["dollars"] = 100
				}
			}
		}
	},
	["Bloods"] = {
		["perm"] = "Bloods",
		["list"] = {
			["c4"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 1,
					["explosives"] = 5,
					["sheetmetal"] = 1,
					["pliers"] = 1
				}
			},
			["attachsSilencer"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 10,
					["roadsigns"] = 2,
					["aluminum"] = 3
				}
			},
			["dismantle"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["dollars"] = 100
				}
			}
		}
	},
	["Weapons2"] = {
		["perm"] = "Weapons2",
		["list"] = {
			["WEAPON_PISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 30,
					["glass"] = 30,
					["rubber"] = 30
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 75,
					["copper"] = 75,
					["plastic"] = 35,
					["glass"] = 35,
					["rubber"] = 35
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 75,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_REVOLVER"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 75,
					["copper"] = 75,
					["plastic"] = 35,
					["glass"] = 35,
					["rubber"] = 25
				}
			},
			["WEAPON_PUMPSHOTGUN_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 100,
					["glass"] = 100,
					["rubber"] = 100
				}
			},
			["WEAPON_SAWNOFFSHOTGUN"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 75,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_GUSENBERG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 100,
					["glass"] = 100,
					["rubber"] = 100
				}
			},
			["WEAPON_APPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 30,
					["glass"] = 30,
					["rubber"] = 30
				}
			},
			["WEAPON_SNSPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 35,
					["copper"] = 35,
					["plastic"] = 15,
					["glass"] = 15,
					["rubber"] = 10
				}
			},
			["WEAPON_PISTOL50"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 75,
					["copper"] = 75,
					["plastic"] = 30,
					["glass"] = 30,
					["rubber"] = 25
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 80,
					["glass"] = 80,
					["rubber"] = 75
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 25,
					["glass"] = 25,
					["rubber"] = 25
				}
			},
			["WEAPON_SNSPISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 25,
					["glass"] = 25,
					["rubber"] = 25
				}
			},
			["WEAPON_VINTAGEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 25,
					["plastic"] = 15,
					["glass"] = 15,
					["rubber"] = 15
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 75,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_ADVANCEDRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 175,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_BULLPUPRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_BULLPUPRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_SPECIALCARBINE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_SPECIALCARBINE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_SMG_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 150,
					["copper"] = 350,
					["plastic"] = 100,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_ASSAULTRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_ASSAULTSMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 150,
					["copper"] = 350,
					["plastic"] = 100,
					["glass"] = 75,
					["rubber"] = 75
				}
			}
		}
	},
	["Weapons"] = {
		["perm"] = "Weapons",
		["list"] = {
			["WEAPON_PISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 30,
					["glass"] = 30,
					["rubber"] = 30
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 75,
					["copper"] = 75,
					["plastic"] = 35,
					["glass"] = 35,
					["rubber"] = 35
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 75,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_REVOLVER"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 75,
					["copper"] = 75,
					["plastic"] = 35,
					["glass"] = 35,
					["rubber"] = 25
				}
			},
			["WEAPON_PUMPSHOTGUN_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 100,
					["glass"] = 100,
					["rubber"] = 100
				}
			},
			["WEAPON_SAWNOFFSHOTGUN"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 75,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_GUSENBERG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 100,
					["glass"] = 100,
					["rubber"] = 100
				}
			},
			["WEAPON_APPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 30,
					["glass"] = 30,
					["rubber"] = 30
				}
			},
			["WEAPON_SNSPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 35,
					["copper"] = 35,
					["plastic"] = 15,
					["glass"] = 15,
					["rubber"] = 10
				}
			},
			["WEAPON_PISTOL50"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 75,
					["copper"] = 75,
					["plastic"] = 30,
					["glass"] = 30,
					["rubber"] = 25
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 80,
					["glass"] = 80,
					["rubber"] = 75
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 25,
					["glass"] = 25,
					["rubber"] = 25
				}
			},
			["WEAPON_SNSPISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 25,
					["glass"] = 25,
					["rubber"] = 25
				}
			},
			["WEAPON_VINTAGEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 25,
					["plastic"] = 15,
					["glass"] = 15,
					["rubber"] = 15
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 75,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_ADVANCEDRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 175,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_BULLPUPRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_BULLPUPRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_SPECIALCARBINE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_SPECIALCARBINE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_SMG_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 150,
					["copper"] = 350,
					["plastic"] = 100,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_ASSAULTRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_ASSAULTSMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 150,
					["copper"] = 350,
					["plastic"] = 100,
					["glass"] = 75,
					["rubber"] = 75
				}
			}
		}
	},
	["Weapons"] = {
		["perm"] = "Weapons",
		["list"] = {
			["WEAPON_PISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 30,
					["glass"] = 30,
					["rubber"] = 30
				}
			},
			["WEAPON_MACHINEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 75,
					["copper"] = 75,
					["plastic"] = 35,
					["glass"] = 35,
					["rubber"] = 35
				}
			},
			["WEAPON_MICROSMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 75,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_REVOLVER"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 75,
					["copper"] = 75,
					["plastic"] = 35,
					["glass"] = 35,
					["rubber"] = 25
				}
			},
			["WEAPON_PUMPSHOTGUN_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 100,
					["glass"] = 100,
					["rubber"] = 100
				}
			},
			["WEAPON_SAWNOFFSHOTGUN"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 75,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_GUSENBERG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 100,
					["glass"] = 100,
					["rubber"] = 100
				}
			},
			["WEAPON_APPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 30,
					["glass"] = 30,
					["rubber"] = 30
				}
			},
			["WEAPON_SNSPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 35,
					["copper"] = 35,
					["plastic"] = 15,
					["glass"] = 15,
					["rubber"] = 10
				}
			},
			["WEAPON_PISTOL50"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 75,
					["copper"] = 75,
					["plastic"] = 30,
					["glass"] = 30,
					["rubber"] = 25
				}
			},
			["WEAPON_MINISMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 80,
					["glass"] = 80,
					["rubber"] = 75
				}
			},
			["WEAPON_PISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 25,
					["glass"] = 25,
					["rubber"] = 25
				}
			},
			["WEAPON_SNSPISTOL_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 45,
					["plastic"] = 25,
					["glass"] = 25,
					["rubber"] = 25
				}
			},
			["WEAPON_VINTAGEPISTOL"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["pistolbody"] = 3,
					["aluminum"] = 45,
					["copper"] = 25,
					["plastic"] = 15,
					["glass"] = 15,
					["rubber"] = 15
				}
			},
			["WEAPON_COMPACTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 125,
					["copper"] = 325,
					["plastic"] = 75,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_ADVANCEDRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 175,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_BULLPUPRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_BULLPUPRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_SPECIALCARBINE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_SPECIALCARBINE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_SMG_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 150,
					["copper"] = 350,
					["plastic"] = 100,
					["glass"] = 75,
					["rubber"] = 75
				}
			},
			["WEAPON_ASSAULTRIFLE"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_ASSAULTRIFLE_MK2"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["riflebody"] = 3,
					["aluminum"] = 225,
					["copper"] = 225,
					["plastic"] = 125,
					["glass"] = 125,
					["rubber"] = 125
				}
			},
			["WEAPON_ASSAULTSMG"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["smgbody"] = 3,
					["aluminum"] = 150,
					["copper"] = 350,
					["plastic"] = 100,
					["glass"] = 75,
					["rubber"] = 75
				}
			}
		}
	},
	["Mechanic"] = {
		["perm"] = "Mechanic",
		["list"] = {
			["toolbox"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 6,
					["copper"] = 4,
					["plastic"] = 2,
					["glass"] = 2,
					["rubber"] = 2
				}
			},
			["advtoolbox"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 20,
					["copper"] = 30,
					["plastic"] = 5,
					["glass"] = 5,
					["rubber"] = 5
				}
			},
			["tyres"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 2,
					["rubber"] = 5
				}
			},
			["plate"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["aluminum"] = 6,
					["copper"] = 6,
					["plastic"] = 1,
					["glass"] = 1,
					["rubber"] = 1
				}
			},
			["lockpick"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["plastic"] = 5,
					["rubber"] = 5,
					["aluminum"] = 10,
					["glass"] = 4
				}
			},
			["notebook"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 10,
					["explosives"] = 6,
					["aluminum"] = 25,
					["plastic"] = 15,
					["glass"] = 15
				}
			}
		}
	},
	["Inventory"] = {
		["list"] = {
			["ketchup"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["emptybottle"] = 1,
					["tomato"] = 3
				}
			},
			["campfire"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["woodlog"] = 10,
					["alcohol"] = 1,
					["lighter"] = 1
				}
			},
			["gauze"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["cotton"] = 2,
					["alcohol"] = 1,
					["plaster"] = 1,
					["silk"] = 1
				}
			}
		}
	},
	["Fuels"] = {
		["list"] = {
			["WEAPON_PETROLCAN"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["dollars"] = 75
				}
			},
			["WEAPON_PETROLCAN_AMMO"] = {
				["amount"] = 4500,
				["destroy"] = false,
				["require"] = {
					["dollars"] = 205
				}
			}
		}
	},
	["Favela1"] = {
		["perm"] = "Favela1",
		["list"] = {
            ["handcuff"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                	["aluminum"] = 50,
					["elastic"] = 15
                }
            },
			["attachsGrip"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 10,
					["roadsigns"] = 6,
					["sheetmetal"] = 6
				}
			},
            ["tablemeth"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                    ["woodlog"] = 20,
                    ["rubber"] = 15,
                    ["glass"] = 25,
                    ["aluminum"] = 10,
                }
            }
        }
    },
	["Favela2"] = {
		["perm"] = "Favela2",
		["list"] = {
            ["hood"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
					["elastic"] = 15
                }
            },
			["attachsMuzzleFat"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 10,
					["roadsigns"] = 6,
					["sheetmetal"] = 6
				}
			},
            ["tablecoke"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                    ["woodlog"] = 20,
                    ["rubber"] = 15,
                    ["glass"] = 25,
                    ["aluminum"] = 10,
                }
            }
        }
    },
	["Favela3"] = {
		["perm"] = "Favela3",
		["list"] = {
            ["handcuff"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                	["aluminum"] = 50,
					["elastic"] = 15
                }
            },
			["attachsBarrel"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 10,
					["roadsigns"] = 6,
					["sheetmetal"] = 6
				}
			},
            ["tableweed"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                    ["woodlog"] = 20,
                    ["rubber"] = 15,
                    ["glass"] = 25,
                    ["aluminum"] = 10,
                }
            }
        }
    },
	["Favela4"] = {
		["perm"] = "Favela4",
		["list"] = {
            ["hood"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
					["elastic"] = 15
                }
            },
			["attachsMuzzleHeavy"] = {
				["amount"] = 1,
				["destroy"] = false,
				["require"] = {
					["techtrash"] = 10,
					["roadsigns"] = 6,
					["sheetmetal"] = 6
				}
			},
            ["lean"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                    ["codeine"] = 5,
					["water"] = 10
                }
            }
        }
    },
	["Mecanica"] = {
		["perm"] = "Mechanic",
		["list"] = {
			["dismantle"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                    ["dollarsroll"] = 5000
                }
            },
            ["nitro"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                	["techtrash"] = 15,
					["sheetmetal"] = 15
                }
            },
			["credential"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                	["dollarsroll"] = 2500
                }
            },
			["notebook"] = {
                ["amount"] = 1,
                ["destroy"] = false,
                ["require"] = {
                	["techtrash"] = 35,
					["sheetmetal"] = 25
                }
            },
        }
    },
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTPERM
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestPerm(craftType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getFines(user_id) > 0 then
			TriggerClientEvent("Notify",source,"vermelho","Multas pendentes encontradas.",3000)
			return false
		end

		if exports["hud"]:Wanted(user_id) then
			return false
		end

		if craftList[craftType]["perm"] ~= nil then
			if not vRP.hasGroup(user_id,craftList[craftType]["perm"]) then
				return false
			end
		end

		return true
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.requestCrafting(craftType)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local inventoryShop = {}
		for k,v in pairs(craftList[craftType]["list"]) do
			local craftList = {}
			for k,v in pairs(v["require"]) do
				table.insert(craftList,{ name = itemName(k), amount = v })
			end

			table.insert(inventoryShop,{ name = itemName(k), index = itemIndex(k), key = k, peso = itemWeight(k), list = craftList, amount = parseInt(v["amount"]), desc = itemDescription(k), economy = itemEconomy(k) })
		end

		local inventoryUser = {}
		local inventory = vRP.userInventory(user_id)
		for k,v in pairs(inventory) do
			v["amount"] = parseInt(v["amount"])
			v["name"] = itemName(v["item"])
			v["peso"] = itemWeight(v["item"])
			v["index"] = itemIndex(v["item"])
			v["economy"] = itemEconomy(v["item"])
			v["key"] = v["item"]
			v["slot"] = k

			local splitName = splitString(v["item"],"-")
			if splitName[2] ~= nil then
				if itemDurability(v["item"]) then
					v["durability"] = parseInt(os.time() - splitName[2])
					v["days"] = itemDurability(v["item"])
				else
					v["durability"] = 0
					v["days"] = 1
				end
			else
				v["durability"] = 0
				v["days"] = 1
			end

			inventoryUser[k] = v
		end

		return inventoryShop,inventoryUser,vRP.inventoryWeight(user_id),vRP.getWeight(user_id)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONCRAFTING
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionCrafting(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end

		if craftList[shopType]["list"][shopItem] then
			if vRP.checkMaxItens(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"] * shopAmount) then
				TriggerClientEvent("Notify",source,"amarelo","Limite atingido.",3000)
				TriggerClientEvent("crafting:Update",source,"requestCrafting")
				return
			end

			if (vRP.inventoryWeight(user_id) + (itemWeight(shopItem) * parseInt(shopAmount))) <= vRP.getWeight(user_id) then
				if shopItem == "WEAPON_NAIL_AMMO" then
					local Inventory = vRP.userInventory(user_id)
					if Inventory then
						for k,v in pairs(Inventory) do
							if string.sub(v["item"],1,5) == "badge" then
								vRP.removeInventoryItem(user_id,v["item"],1,false)
								vRP.generateItem(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"] * shopAmount,false,slot)
								break
							end
						end
					end
				else
					for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
						local consultItem = vRP.getInventoryItemAmount(user_id,k)
						if consultItem[1] < parseInt(v * shopAmount) then
							return
						end

						if vRP.checkBroken(consultItem[2]) then
							TriggerClientEvent("Notify",source,"vermelho","Item quebrado.",5000)
							return
						end
					end

					for k,v in pairs(craftList[shopType]["list"][shopItem]["require"]) do
						local consultItem = vRP.getInventoryItemAmount(user_id,k)
						vRP.removeInventoryItem(user_id,consultItem[2],parseInt(v * shopAmount))
					end

					vRP.generateItem(user_id,shopItem,craftList[shopType]["list"][shopItem]["amount"] * shopAmount,false,slot)
				end
			end
		end

		TriggerClientEvent("crafting:Update",source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONDESTROY
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.functionDestroy(shopItem,shopType,shopAmount,slot)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if shopAmount == nil then shopAmount = 1 end
		if shopAmount <= 0 then shopAmount = 1 end
		local splitName = splitString(shopItem,"-")

		if craftList[shopType]["list"][splitName[1]] then
			if craftList[shopType]["list"][splitName[1]]["destroy"] then
				if vRP.checkBroken(shopItem) then
					TriggerClientEvent("Notify",source,"vermelho","Itens quebrados reciclados.",5000)
					TriggerClientEvent("crafting:Update",source,"requestCrafting")
					return
				end

				if vRP.tryGetInventoryItem(user_id,shopItem,craftList[shopType]["list"][splitName[1]]["amount"]) then
					for k,v in pairs(craftList[shopType]["list"][splitName[1]]["require"]) do
						if parseInt(v) <= 1 then
							vRP.generateItem(user_id,k,1)
						else
							vRP.generateItem(user_id,k,v / 2)
						end
					end
				end
			end
		end

		TriggerClientEvent("crafting:Update",source,"requestCrafting")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:populateSlot")
AddEventHandler("crafting:populateSlot",function(nameItem,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		if vRP.tryGetInventoryItem(user_id,nameItem,amount,false,slot) then
			vRP.giveInventoryItem(user_id,nameItem,amount,false,target)
			TriggerClientEvent("crafting:Update",source,"requestCrafting")
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("crafting:updateSlot")
AddEventHandler("crafting:updateSlot",function(nameItem,slot,target,amount)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if amount == nil then amount = 1 end
		if amount <= 0 then amount = 1 end

		local inventory = vRP.userInventory(user_id)
		if inventory[tostring(slot)] and inventory[tostring(target)] and inventory[tostring(slot)]["item"] == inventory[tostring(target)]["item"] then
			if vRP.tryGetInventoryItem(user_id,nameItem,amount,false,slot) then
				vRP.giveInventoryItem(user_id,nameItem,amount,false,target)
			end
		else
			vRP.swapSlot(user_id,slot,target)
		end

		TriggerClientEvent("crafting:Update",source,"requestCrafting")
	end
end)