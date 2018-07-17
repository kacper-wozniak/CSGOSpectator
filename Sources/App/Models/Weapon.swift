//
//  Weapon.swift
//  CSGOSpectatorPackageDescription
//
//  Created by Kacper Woźniak on 08/04/2018.
//

enum WeaponName: String, Codable {

    case weapon_c4
    case weapon_flashbang, weapon_molotov, weapon_smokegrenade, weapon_hegrenade, weapon_decoy, weapon_incgrenade
    case weapon_taser
    case weapon_knife, weapon_knife_t, weapon_bayonet, weapon_knife_m9_bayonet, weapon_knife_karambit, weapon_knife_push, weapon_knife_gut, weapon_knife_flip, weapon_knife_butterfly, weapon_knife_falchion, weapon_knife_tactical, weapon_knife_survival_bowie
    case weapon_glock, weapon_p250, weapon_deagle, weapon_usp_silencer, weapon_fiveseven, weapon_tec9, weapon_cz75a, weapon_hkp2000, weapon_elite, weapon_revolver
    case weapon_mac10, weapon_mp9, weapon_mp7, weapon_ump45, weapon_p90, weapon_bizon
    case weapon_nova, weapon_sawedoff, weapon_mag7
    case weapon_m4a1, weapon_galilar, weapon_ak47, weapon_m4a1_silencer, weapon_aug, weapon_famas, weapon_sg556
    case weapon_awp, weapon_ssg08, weapon_scar20, weapon_g3sg1
    case weapon_xm1014, weapon_negev, weapon_m249

}

enum WeaponType: String, Codable {

    case C4, Shotgun, SubmachineGun = "Submachine Gun", MachineGun = "Machine Gun", Pistol, Knife, Rifle, Grenade, SniperRifle

}

enum WeaponState: String, Codable {

    case holstered, active

}

struct Weapon: Codable {

    let name: WeaponName
    let type: WeaponType?
    let state: WeaponState
    let ammo_clip: Int?
    let ammo_clip_max: Int?
    let ammo_reserve: Int?

}
