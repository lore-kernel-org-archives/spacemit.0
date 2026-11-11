Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794395152;
	b=tyqNSgj78iLQ9O332tQYZe6iPGDfMYeHrvfKWl/R95EXsutGbZdEwSrVTLlDNr4ri/ab
	 m1pHiGFYW87OCSvEZpxunv3+gdjcb6u0J3U6pV69KUjlIDc3JPo8yBF0DHVwBaemUxksk
	 hpkb7TrVqBItB6Cf1DjTTivUH13WmOK9hoAHVmWteEZohLYwvReaVKoem8rExhOrY1eRv
	 y55R3UybNkvtiYPzIi8JquOHO1CcDVjNQJT9sVqStjVC+Grr2yV5OHFb16cKusIKGVRnQ
	 vA70/1e1iqzL7hKzdO6dq5Ygfef52TmOwO2B3tO8OwdhbIl/m9/v2SuYv+2An5x+f8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=1din0TNnBV2KJ8sSuRJVbvK1d3dMFjZgO4N2assoioU=;
	b=sHXNOhiWIYCk3EYj86TDZ/lBcImOkYz4LGILOhvpa/jfRVyxJ3N2onwnWF0j2WT7aqSh
	 TEyCiCcaF7Nb9sob/bbunDpNpdDQ+THBPg1y0rwB6Wuu16+KXblbv100eOuLd0jjV0nVp
	 gsjUmBt2lScwu0FXgrCn7chK8qtC49RZH+w04+5Q62NDQDQydvec5SMvYaCNDdQfuPLjj
	 kQPaThWl+ZfBFWx3gHrjSYt2JEQz9ZbcpeiKXcQNPgnCWRF3ZrQqR8h53xSmbD/gCIDJi
	 j4CtMBuoKGNphMHvZVdbEefx22uE+vN/mR2fmal53UYfXwksLT0OEF3mU8L4RNcYB3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lALwydcn;
	arc=fail smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FAA606A327
	for <spacemit@lists.linux.dev>; Wed, 11 Nov 2026 11:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3FAA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lALwydcn
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1882357a12.2
        for <spacemit@lists.linux.dev>; Wed, 11 Nov 2026 03:05:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794395150; cv=none;
        d=google.com; s=arc-20260327;
        b=EndJ4BrLYWXIzwJT8eO3ygeKK9Gt33dBeZ51gv5QnJcoRZhVZpQLkxlcxmIdS20U10
         ZH04vYjZqj1/345K8u4KuR3rg2GCWe16e33OLSeAn6sb9BP/KSnCTIZoqEr8ZiLwIowX
         ZbDgouODrA23P+9Efz7WXbvRDk8Ek+Zu9ilDEIQmfgKArPRRvvyw5uZDS7uNW60VZsDF
         p7OcAABKuZAWEBhiZZ1id9x6PAQCIFF9t50BMvW4fw58mzwsb7TIWL7pWJftkRSGYjxM
         eMr42VrIVKrubC1R6F5TsMjCQgONpUFjW7RDBSeJmDLc0lUBwSjJD1jepzVpa4e8aZTt
         Ji8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1din0TNnBV2KJ8sSuRJVbvK1d3dMFjZgO4N2assoioU=;
        fh=iV/VPQtPDm6aAY4+BRoqf+zsAq1kp54fsnp8Z+aQzt0=;
        b=YqsX2m+JQes6YuGfU7lI34VOHbdM8PitH35kv1YZvUVmfKWBz4M1bVrhA1Ll5WbX0I
         +a46n1ZYF0/NYm1AmE6YDpnuhZP7z9wepb7vpBiYaacYT1MFGTKjMnQfe8ffYScz/1vR
         CYc3PVELpDhATVielWbb8IlGw3SuovTis465MflvxZMW12SMPE+guiTYjDP4GKduQWJU
         DzMfpc1D4USYSAnzB/TxaVKyIiMo/RG7gJSiU8a6D0OuEUGXubGeEUQ7Pa6m4302KBNm
         pkHjTe004s69RiaiVkoTOD69LTbkm5l8clr7Y4uMuQT2pxKqCmEb8WLFbZKYy0ZINqw9
         6P2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395150; x=1794999950; darn=lists.linux.dev;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1din0TNnBV2KJ8sSuRJVbvK1d3dMFjZgO4N2assoioU=;
        b=lALwydcnFAxiyWzDuECrZNTOfKtW6qncjDbBUMS1RNrD1879vu5E7sgZwTqIHh/Est
         8c6uDsYUnQ13HNrKafkohM3XpzTkzANJu6O16qHniZLiwR8rSHtLXzZSZvUO3AF2rxpo
         NCpB0zh44g8nQGWEdJbg9sMEMjbpnCRz01+J/JiMlNM0E1vaxHl/BEKkGAr9zP9GVque
         dyxyw70QkQKIUF467Rh1PLLEzDLULgGCxOU6noWwcgGC7Y4DuK489N1NX2luQcyRa5ki
         hG9fo4+ESCKsE4j7RfhTlL1q/WlrOYd7ueyP4Xvt11pJlBqts1ToR4KoM4DeYvpeSBxu
         JUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395150; x=1794999950;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1din0TNnBV2KJ8sSuRJVbvK1d3dMFjZgO4N2assoioU=;
        b=bmcD9HgEif8/z6WimjfIGmscrAT6il3xYqtNwkYxq8pQ0tHySt2X5Cn9h+K5guhU5v
         z91ig7c+/JEjT+uyBxCu2r8PQH37a9xU9cLzJh3gejmE6Z6PVKrTY/Q6TUCGBidHCfxF
         p1fFgtSQLImtpQnQCwLy7WzJqcyVwIyofrzWZzkkCAJmtCmR1fde/3QPkR34xgpq4b0y
         za3wBW0A0lIXQ7+Hwb5fb8zXZyvKGQLqz8vXAV/Vs7ZGkKhTk6Ja3q8wtSaZNW+3DHRT
         c4Fo0BdLEJ26oKcqRRGoM9MZ3HP1QT4O/s1Xyd6SDp5RbozL9Zx6yfblQsinPAdMdzET
         utUg==
X-Forwarded-Encrypted: i=1; AL+hErGjoCOaPY0R5S8RjOXmFAuAM/q7CWytz5OnvFb+IU2ONxCH0VC2LfduWnDZQOgDlPRNNy2vn9uhWg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Sq255NSoWy/cqLC6zmLVLaQMYHqy/9q9v5BvFUrhb6bI7GEJL
	Mt5JdDuU2FrqzWk0bRIqnQxzS1XBphS1MGhBXl2GzbO2S6NQedsNK5ZZmZGLvqNdiLt/IW+/hGm
	Af1LCq1QnnO3kAR86VEfgYbAbpHfrPFU=
X-Gm-Gg: AYBFou0mMUQMUOCO5jbjJmbsqtj3plJ56ep3tqdGUlM5kb9x6Qxlan2sIWutCQ2VxiK
	FUDhDeHI4Jq4OJ1C6j6hQgWUw0XIsq/tVFo/bzuM6Mmb42Vq3/KrKwup5qQC1/beU2dUKT4mJJe
	xNFjBXv4MypQ8U5czqupfCQ4mU3xRO2+tZWnfcK8e367Blgaa5uGBDSDRDn1y82tqGtO/aZL9IS
	xqT0OIs9xUT4+hkqZAxdbue8UOC70vcOY2tUvCLpVkOjhGTMQhxWqMDtw0Som72LuELcwm4CvoZ
	uLsvJH2Cs13TsR/huYpxmty+Rp5SDXVJoryVdB+cqELWwkfeqx4h1GvifLU2E+7ftCcdkYQck04
	YAa4TWG+QEuV3WnlrKR1cdMXkuNeFL9mAbQs=
X-Received: by 2002:aa7:cd5b:0:b0:6b4:87b8:1348 with SMTP id
 4fb4d7f45d1cf-6b77780f23fmr1150131a12.27.1794395149944; Wed, 11 Nov 2026
 03:05:49 -0800 (PST)
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110061429.2036-1-linux.amoon@gmail.com> <20261110061429.2036-2-linux.amoon@gmail.com>
 <avOL1mCkI4YSaDeO@aurel32.net> <DMRZGMGRLD4S.KT6VEU28902E@linux.spacemit.com> <avQ1kVTvdCmS1MxN@aurel32.net>
In-Reply-To: <avQ1kVTvdCmS1MxN@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 11 Nov 2026 16:35:27 +0530
X-Gm-Features: AclHuK9H8LcNFBf6OiW50_NDYDV5SRfOSw_9EFpDafFKu57Cw77PmBIsH4iiL2Y
Message-ID: <CANAwSgQgtEvgEfkBMC6meDzT4O28oEX-R16STeiUnP77UOQe_Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C
 transfers for power-off and restart
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Anand Moon <linux.amoon@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Troy. Aurelien,

Thanks for your review comments.

On Wed, 11 Nov 2026 at 14:59, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Troy,
>
> On 2026-11-11 01:16, Troy Mitchell wrote:
> > Hi Aurelien,
> >
> > On Tue Nov 10, 2026 at 9:25 PM GMT, Aurelien Jarno wrote:
> > > Hi Anand,
> > >
> > > On 2026-11-10 11:44, Anand Moon wrote:
> > >> The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
> > >> to access the PMIC. However, these handlers run in an atomic notifier
> > >> context (specifically within an rcu_read_lock() critical section), while
> > >> the I2C-backed regmap uses a sleepable mutex.
> > >>
> > >> This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
> > >> context switch in the RCU read-side critical section during shutdown on the
> > >> Banana Pi BPI-F3:
> > >>
> > >> [  563.803475] WARNING: suspicious RCU usage
> > >> [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
> > >> [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
> > >> ...
> > >> [  563.841445] locks held by shutdown/1: 2, last CPU#0:
> > >> [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
> > >> [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2
> > >>
> > >> Replace the regmap operations with atomic I2C transfers to avoid sleeping
> > >> in an atomic context. Preserve unrelated register bits through
> > >> read-modify-write operations and check for atomic I2C support before
> > >> registering the handlers.
> > >>
> > >> Obtain the I2C client from the parent device and verify that the adapter
> > >> supports atomic transfers before registering the handlers.
> > >>
> > >> Tested on the Banana Pi BPI-F3 (SpacemiT K1).
> > >
> > > While the patch looks correct, I am not sure this is the correct
> > > approach, as opposed to the one proposed by Troy [1].
> > >
> > > Indeed bypassing regmap and using i2c atomic transfers needs to be done
> > > by all affected drivers. For instance the VisionFive 2 board, which use
> > > an axp15060 PMIC is also affected by this issue. And the corresponding
> > > driver is shared between architectures, which make this kind of change
> > > more difficult.
> > >
> > > For the BPI-F3, note that with OpenSBI 1.9, the reboot is handled
> > > through the SBI SRST extension, preventing this issue to happen. On the
> > > long term, I am not sure we should keep this driver.
> > >
> > That only covers restart. The SBI restart handler is registered at
> > priority 192 and runs before the P1 one at SYS_OFF_PRIO_DEFAULT. Power
> > off is the other way around: sbi_srst_power_off() goes through
> > register_platform_power_off(), i.e. SYS_OFF_PRIO_PLATFORM, so the P1
> > power-off handler still runs first and still hits this on shutdown,
> > even with OpenSBI 1.9.
> >

I had previously tested the OpenSBI P1 PMIC driver in a Yocto-based environment:

[1] https://lore.kernel.org/all/20260419150857.2705843-3-aurelien@aurel32.net/

With this driver registered in OpenSBI, Linux can delegate reboot and power-off
operations to firmware through the SBI SRST extension.

The power-off sequence is:
    Linux kernel_power_off()
      -> RISC-V machine power-off
      -> SBI SRST shutdown
      -> OpenSBI system_reset()
      -> SpacemiT P1 PMIC
      -> Power off

I have now rebuilt the Linux kernel with:

 # CONFIG_POWER_RESET_SPACEMIT_P1 is not set

Both reboot and power-off work correctly on the Banana Pi BPI-F3,
and I have not observed any issues.

alarm@k1:~$ sudo poweroff

Broadcast message from root@k1 on pts/1 (Wed 2026-11-11 10:34:03 UTC):

The system will power off now!

[ 1744.735287] systemd-shutdown[1]: Sending SIGTERM to remaining processes...
[ 1745.071304] systemd-journald[245]: Received SIGTERM from PID 1
(systemd-shutdow).
[ 1745.504595] systemd-shutdown[1]: Sending SIGKILL to remaining processes...
[ 1745.790159] systemd-shutdown[1]: Unmounting file systems.
[ 1745.822902] (sd-umount)[658]: Unmounting
'/run/credentials/systemd-journald.service'.
[ 1745.861214] (sd-remount)[659]: Remounting '/' read-only with options ''.
[ 1746.079291] EXT4-fs (mmcblk1p7): re-mounted
ccb95ca0-2804-4ade-938f-23116f90c193 ro.
[ 1746.272104] systemd-shutdown[1]: All filesystems unmounted.
[ 1746.272471] systemd-shutdown[1]: Deactivating swaps.
[ 1746.273712] systemd-shutdown[1]: All swaps deactivated.
[ 1746.273956] systemd-shutdown[1]: Detaching loop devices.
[ 1746.464867] systemd-shutdown[1]: All loop devices detached.
[ 1746.465346] systemd-shutdown[1]: Stopping MD devices.
[ 1746.471149] systemd-shutdown[1]: All MD devices stopped.
[ 1746.471417] systemd-shutdown[1]: Detaching DM devices.
[ 1746.476047] systemd-shutdown[1]: All DM devices detached.
[ 1746.476377] systemd-shutdown[1]: All filesystems, swaps, loop
devices, MD devices and DM devices detached.
[ 1746.533569] systemd-shutdown[1]: Successfully changed into root pivot.
[ 1746.533862] systemd-shutdown[1]: Entering exitrd...
[ 1746.686127] shutdown[1]: Syncing filesystems and block devices.
[ 1746.701832] shutdown[1]: Sending SIGTERM to remaining processes...
[ 1746.934370] shutdown[1]: Sending SIGKILL to remaining processes...
[ 1747.164219] shutdown[1]: Unmounting file systems.
[ 1747.203935] (sd-umoun[662]: Unmounting '/run/credentials'.
[ 1747.232643] (sd-umoun[663]: Unmounting '/oldroot/sys/kernel/config'.
[ 1747.269882] (sd-umoun[664]: Unmounting '/oldroot/sys/kernel/tracing'.
[ 1747.298218] (sd-umoun[665]: Unmounting '/oldroot/sys/kernel/debug'.
[ 1747.327488] (sd-umoun[666]: Unmounting '/oldroot/dev/hugepages'.
[ 1747.359053] (sd-umoun[667]: Unmounting '/oldroot/dev/mqueue'.
[ 1747.387798] (sd-umoun[668]: Unmounting '/oldroot/run'.
[ 1747.425939] (sd-umoun[669]: Unmounting '/oldroot/proc'.
[ 1747.473927] (sd-umoun[670]: Unmounting '/oldroot/sys/fs/bpf'.
[ 1747.527910] (sd-umoun[671]: Unmounting '/oldroot/sys/fs/pstore'.
[ 1747.588367] (sd-umoun[672]: Unmounting '/oldroot/sys/fs/cgroup'.
[ 1747.630489] (sd-umoun[673]: Unmounting '/oldroot/sys/kernel/security'.
[ 1747.664244] (sd-umoun[674]: Unmounting '/oldroot/sys'.
[ 1747.704716] (sd-umoun[675]: Unmounting '/oldroot/dev/pts'.
[ 1747.755218] (sd-umoun[676]: Unmounting '/oldroot/dev/shm'.
[ 1747.791652] (sd-umoun[677]: Unmounting '/oldroot/dev'.
[ 1747.826501] (sd-umoun[678]: Unmounting '/oldroot'.
[ 1748.451336] EXT4-fs (mmcblk1p7): unmounting filesystem
ccb95ca0-2804-4ade-938f-23116f90c193.
[ 1748.643359] shutdown[1]: All filesystems unmounted.
[ 1748.643640] shutdown[1]: Deactivating swaps.
[ 1748.644512] shutdown[1]: All swaps deactivated.
[ 1748.644722] shutdown[1]: Detaching loop devices.
[ 1748.732490] shutdown[1]: All loop devices detached.
[ 1748.732764] shutdown[1]: Stopping MD devices.
[ 1748.754002] shutdown[1]: All MD devices stopped.
[ 1748.754286] shutdown[1]: Detaching DM devices.
[ 1748.759617] shutdown[1]: All DM devices detached.
[ 1748.759885] shutdown[1]: All filesystems, swaps, loop devices, MD
devices and DM devices detached.
[ 1748.770510] shutdown[1]: Syncing filesystems and block devices.
[ 1748.791699] shutdown[1]: Powering off.
[ 1749.009246] reboot: Power down

Given that OpenSBI already handles both operations,
I agree that the Linux P1 power-off and reset driver may no longer be necessary,
at least on systems using firmware with the appropriate SBI SRST support.

> > So until this driver goes away, BPI-F3 still needs the arch fix [1]
> > for power-off.
> >
> > Link: https://lore.kernel.org/linux-riscv/20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev/ [1]
>
> We also need a more global fix for the other boards like the VisionFive
> 2, so definitely we need the above fix instead of patching the drivers.
>
Maybe we need an opensbi driver for VisionFive 2 dev boards; any thoughts
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks
-Anand
