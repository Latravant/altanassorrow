-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    select_default_macro_book()
	send_command('wait 2; input /lockstyleset 1')

end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="incantor stone",
        head="befouled crown",neck="Orison Locket",ear2="Loquacious Earring",
        body="chironic doublet",hands="chironic gloves",ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="chironic hose",feet="Chironic slippers	"}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {main="queller rod", sub ="culminus",
		head="theophany cap", neck="aceso's choker +1", 
		body="nefer kalasiris", 
		waist="acerbic sash +1", feet="litany clogs"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = sets.precast.FC['Healing Magic']
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Nahtirah Hat",ear1="Roundel Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",
        back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = ""
    sets.precast.WS = {
        head="Nahtirah Hat",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Refraction Cape",waist=gear.ElementalBelt,legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    
    sets.precast.WS['Flash Nova'] = {
        head="Nahtirah Hat",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Strendu Ring",
        back="Toro Cape",waist="Thunder Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    

    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        head="Nahtirah Hat",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    
    -- Cure sets
    gear.default.obi_waist = "Goading Belt"
    gear.default.obi_back = "Mending Cape"

    sets.midcast.CureSolace = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
        head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
        body="Orison Bliaud +2",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
        back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

    sets.midcast.Cure = {main="queller rod", sub ="culminus",ammo="mana ampulla",
		head="theophany cap",neck="cleric's torque", ear1="roundel earring", ear2="spellbreaker earring", 
		body="chironic doublet",hands="theophany mitts", ring1="janniston ring", ring2="menelaus's ring",
		back="solemnity cape",waist="austerity belt", legs="chironic hose", feet="litany clogs" }

    sets.midcast.Curaga = {main="Tamaxchi",sub="Genbu's Shield",ammo="Incantor Stone",
        head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
        body="Vanir Cotehardie",hands="Theophany Mitts",ring1="Prolix Ring",ring2="Sirona's Ring",
        back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

    sets.midcast.CureMelee = {ammo="Incantor Stone",
        head="Gendewitha Caubeen",neck="Orison Locket",ear1="Lifestorm Earring",ear2="Orison Earring",
        body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Prolix Ring",ring2="Sirona's Ring",
        back="Tuilha Cape",waist=gear.ElementalObi,legs="Orison Pantaloons +2",feet="Piety Duckbills +1"}

    sets.midcast.Cursna = {main="queller rod", sub ="culminus",ammo="mana ampulla",
		head="befouled crown",ear1="flashward earring",ear2="spellbreaker earring",
        body="chironic doublet",hands="theophany mitts",ring1="Ephedra Ring",ring2="Menelaus's ring",
        back="Oretanias Cape +1",waist="witful Belt",legs="Theophany Pantaloons",feet="chironic slippers"}

    sets.midcast.StatusRemoval = {
        head="Orison Cap +2",legs="Orison Pantaloons +2"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = {
		head="befouled crown", 
		hands="chironic gloves",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
		feet="theophany duckbills"}

    sets.midcast.Stoneskin = {
        head="Nahtirah Hat",neck="Orison Locket",ear2="Loquacious Earring",
        body="Vanir Cotehardie",hands="Dynasty Mitts",
        back="Swith Cape +1",waist="Siegel Sash",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    sets.midcast.Auspice = {hands="Dynasty Mitts",feet="Orison Duckbills +2"}

    sets.midcast.BarElement = {main="Beneficus",sub="Genbu's Shield",
        head="Orison Cap +2",neck="Colossus's Torque",
        body="Orison Bliaud +2",hands="Orison Mitts +2",
        back="Mending Cape",waist="Olympus Sash",legs="Piety Pantaloons",feet="Orison Duckbills +2"}

    sets.midcast.Regen = {main="Bolelabunga",sub="Genbu's Shield",
        body="Piety Briault",hands="Orison Mitts +2",
        legs="Theophany Pantaloons"}

    sets.midcast.Protectra = {ear1="brachyura earring",ring1="Sheltered Ring",feet="Piety Duckbills +1"}

    sets.midcast.Shellra = {ear1="brachyura earring",ring1="Sheltered Ring",legs="Piety Pantaloons"}


    sets.midcast['Divine Magic'] = {main="Bolelabunga",sub="Genbu's Shield",
        head="Nahtirah Hat",neck="Colossus's Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring2="Sangoma Ring",
        back="Refraction Cape",waist=gear.ElementalObi,legs="Theophany Pantaloons",feet="Gendewitha Galoshes"}

    sets.midcast['Dark Magic'] = {main="Bolelabunga", sub="Genbu's Shield",
        head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {main="Lehbrailg +2", sub="Mephitis Grip",
        head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Aquasoul Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

    sets.midcast.IntEnfeebles = {main="Lehbrailg +2", sub="Mephitis Grip",
        head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Sangoma Ring",
        back="Refraction Cape",waist="Demonry Sash",legs="Bokwus Slops",feet="Piety Duckbills +1"}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="iridal staff",ammo="mana ampulla", 
        head="befouled crown", neck="eidolon pendant", ear2="antivenom earring",
		body="Theophany Briault",hands="Serpentes Cuffs",ring1="Stikini Ring +1", ring2="Stikini Ring +1",
        back="felicitas cape +1",waist="Austerity Belt",legs="menhit slacks",feet="Chelona Boots"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {main="queller rod", sub="culminus",ammo="homiliary",
        head="chironic hat",neck="aceso's choker +1",ear1="insomnia earring",ear2="ethereal Earring",
        body="theophany briault",hands="chironic gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="solemnity cape",waist="Witful Belt",legs="chironic hose",feet="Herald's Gaiters"}

    sets.idle.PDT = {main="Bolelabunga", sub="Genbu's Shield",ammo="staunch tathlum",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Gendewitha briault",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Witful Belt",legs="Gendewitha Spats",feet="Herald's Gaiters"}

    sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Incantor Stone",
        head="Nahtirah Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Gendewitha briault",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Meridian Ring",
        back="Umbra Cape",waist="Witful Belt",legs="Nares Trews",feet="Gendewitha Galoshes"}
    
    -- Defense sets

    sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
        head="Gendewitha Caubeen",neck="Twilight Torque",
        body="Gendewitha briault",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
        head="Nahtirah Hat",neck="Twilight Torque",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

	sets.lowmp = set_combine(sets.idle,{
	    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
		ammo="Homiliary",
		head={ name="Chironic Hat", augments={'Accuracy+3','"Refresh"+1',}},
		body="Theo. Bliaut",
		hands={ name="Chironic Gloves", augments={'"Fast Cast"+3','MND+3','Accuracy+9 Attack+9',}},
		legs={ name="Chironic Hose", augments={'Rng.Atk.+19','"Cure" spellcasting time -3%','Damage taken-1%','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
		waist="Fucho-no-Obi",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		})
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {ammo="hasty pinion +1",
        head="chironic hat",neck="peacock charm",ear1="Mache Earring",ear2="Mache Earring",
        body="Chironic doublet",hands="chironic gloves",ring1="Chirich Ring",ring2="Chiric Ring",
        back="solemnity Cape",waist="witful Belt",legs="chironic hose",feet="chironic slippers"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
    
    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = "Mending Cape"
    else
        gear.default.obi_back = "Toro Cape"
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end


function customize_idle_set(idleSet)
    if player.mpp < 90 then
        idleSet = sets.lowmp
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 3)
end
