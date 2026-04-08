---
sidebar_position: 2
---

# Configuring Sounds

All sounds you intend to use are stored on the server as Roblox Sound instances. On startup, VluxySF reads this folder and converts it into a schema table, allowing sounds to be reconstructed and played on both the server and client efficiently.

## SoundGroups & Folder Structure

SoundGroups are automatically determined by the folder structure inside your main Sounds folder. You do **not** need to manually assign SoundGroups.

- The first level of children in your Sounds folder should be Folders or Configurations.
- The name of each folder becomes the SoundGroup name.
- Any Sound instances under these subfolders are automatically grouped.

**Example:**
```
Sounds/
	├─ Music/         ← SoundGroup
	│    ├─ MainTheme (Sound)
	│    └─ Battle    (Sound)
	└─ SFX/           ← SoundGroup
			 ├─ Click     (Sound)
			 └─ Explosion (Sound)
```

## Organizing with Subfolders

You can further organize your sounds using subfolders within each SoundGroup. This does not affect grouping, but helps keep your project tidy.

**Example:**
```
Sounds/
  └─ SFX/
	  ├─ UI/
	  │    └─ Click (Sound)
	  └─ Game/
		  └─ Explosion (Sound)
```

## Naming Conventions

- Use clear, descriptive names for both SoundGroups and Sound instances.
- Avoid spaces and special characters for best compatibility.
- Sound names are used as keys for programmatic access (e.g., `Sounds.Create("Explosion")`).

## Configuring Sound Instances

Each Sound instance can be configured with any Roblox sound properties and child sound effects.

- **Properties:** Set properties like `SoundId`, `Volume`, `PlaybackSpeed`, etc., directly on the Sound instance.
- **Effects:** Add child instances such as `EqualizerSoundEffect`, `ReverbSoundEffect`, etc., to the Sound for automatic serialization and reconstruction.

**Example:**
```
SFX/
  └─ Explosion
	  ├─ SoundId: rbxassetid://123456
	  ├─ Volume: 1
	  └─ ReverbSoundEffect
		  └─ Mix: 0.5
```

---

## Advanced Tips

- **Preloading:** Sounds can be preloaded for reduced latency using the API.
- **Dynamic Creation:** You can create and clone sounds programmatically using VluxySF’s API.
- **Validation:** Both client and server validate sound data for security and consistency.

---

## Quick Setup Checklist

1. Organize your Sounds folder with subfolders for each SoundGroup.
2. Place Sound instances inside the appropriate group folders.
3. Configure properties and effects as needed.
4. Access and play sounds using VluxySF’s API by name or definition.
