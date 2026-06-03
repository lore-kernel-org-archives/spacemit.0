Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0263CE080
	for <spacemit@lists.linux.dev>; Tue,  2 Jun 2026 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780441970; cv=none; b=Eq8brT3Z7mhcgl/1WxYNXzx2FrtFOseWBD6cPz6pezgayG5TspvPrZVqRuhdcgRYas0kL489KCpuFN2jbOTIGXsFjg/HP0w9PAE6Wbwl2BqiuN6hiK4n0ofOvrWo5YmXLGOXx5Pmm7OPVu1LIUGUbK+Z+v2v3uSP7+epvY6aR7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780441970; c=relaxed/simple;
	bh=q0l6SoLkv/OD4ArhEhudd5OJ0i0bPlCDCgP82G86E4s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lzABaMbv0jEDWM7GhqyBlYUYuVf79APFop9Kb3E5T0bMVQSU513p3WFyGWxshZGxmioktyvX4zN069qG7NEMq9hB9sEAzZ85wnr/YkZnuY/LZMKa9p6TIHt9zNmIntYF/Hw2XQ+EsDEI0B9JvqU1ECO2tDPWcZAWWOheSPFkxj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PK6Cwqd/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PK6Cwqd/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf20f6be6bso28649445ad.3
        for <spacemit@lists.linux.dev>; Tue, 02 Jun 2026 16:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780441968; x=1781046768; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dVN3EYHVbww+tgJzqqdTHZZxq1gelgNV3Kq1kXyz7N8=;
        b=PK6Cwqd/anqjoZRqdBrop+dwBKcFOG0Kr+bBcW3ZZsSQPM49gZawWrE5eLKFA5UDe3
         TlkYMGE55NFoypHV96Q/vWl+Q/rwMpKKm2ui9O23v+WImisHCdxEia2eV1buivvjk0Nq
         TXqQhuMNnw/tUPjqDqy6e6H6DDRRhVARq3slJDdHxFq+5M0Az6S0l8ojvwQcgML6wnu6
         jhZQPmenzprMh5TZqC4v52TiXoZwT0RyjYqIWWt/pm/qXEVSDg5LuGYdpMtPTI0xYOHr
         +o4Vk3OL7jYBVLngKie6ClBUKx3v2nAnhbjuTLzgpIYuHgIZg895KCKs3FY4nUe53KuL
         2PKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441968; x=1781046768;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVN3EYHVbww+tgJzqqdTHZZxq1gelgNV3Kq1kXyz7N8=;
        b=Sr8xKsqnjiWMj88G3kRhxWSSgxVhYVragYM7wuTaclAelBh15Ypgn5q8tWFP1b+12Q
         6aHaul42pd+n2paLK0GejhBOzaiGmDzFrJyuwmbGeTRxkuiWlV5jfY4v7VYelRULmWNn
         4BPzJlqrvUG1dNSq/u5OhVENMa98IHSsGcg4rCsP1Vy2mA4mOFwXjHZ64uV6383Wd1bY
         WdlB+0zbE6W3YRo5T1Lw2vDbbu1We/Bak1W6cAaOia2eTASnf3sLPwa2Vf5u3B9uIE+6
         vp6n1Ua4MxduxC5QdeMMw5Jq1FoTR0QOdZ5jKOreW+9AMJ1r2bVO8g1qNljgAMl8ZnyP
         Um6w==
X-Forwarded-Encrypted: i=1; AFNElJ+epFsivfaBLHiEVV2FFzZwJNpuqfr2DlEWiYj8hp3UcHTwFQOzf2m/EMUR8YBrzZxdf0tlWnVCbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZapIcD+qJwJd9WMGAKowoU1wcxoxv7jFVd0uDYtMzGAeKOpEf
	7texF4ZHeH+bNvT/GWzFEPSgYjs76FK+ESljpbupkqs1qBO1v5+aUvAO
X-Gm-Gg: Acq92OF0WVXxnZ/3NmByhpco5Sj7czXllMgfrl3i/4Fw3BojL/GgQNlUYBqfXop1ygs
	Y73YSsQE4hzlefsQ3eBFKhpvf3Bq9IQz/adcsMOj9UKocYuUxIqNVYYKXMhjhlUKYJSZQgxyQDw
	QBxOdhMcwF/v1I3DLyRrfFzvPz4lfQUh7NVy4zOAe/GdH1MuX1Tc7Vc+N/SI9HZS0eeA4NMMIkI
	sG2pEH9K8riaYD+gJj0ROZDPfT2+zAk746xAcXdWviZ6gL8D5mn0z2wWE5DbWJ9nbwQneue7Onc
	roKJVvnwAMPvRd+bOp8QlKMboNSDw2Dcea2UYTRuPnSMn1PCevULFJZvDIsmrcS4C+f7LiPDf1F
	UkkUca+7K9ittpgwj+TYa0wOM2ENjN82x3uMLUbf8YnOrbXqxnkqobMgo1mNsIEfdQQ+FhSDOTY
	vhbNt1xe4w8w==
X-Received: by 2002:a17:903:2410:b0:2c0:b6c7:2273 with SMTP id d9443c01a7336-2c163a257e8mr7287705ad.3.1780441968266;
        Tue, 02 Jun 2026 16:12:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:12:47 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Subject: [PATCH v3 00/15] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Wed, 03 Jun 2026 07:11:55 -0400
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPsLIGoC/22NzQ6CMBCEX8Xs2Zp2+RE9+R6GQ1sWqYmUbKFqC
 O9uQY8mc/mSmflmCMSOApx3MzBFF5zvE2T7HdhO9zcSrkkMKLGUhawER43ZVOaiew7sDYmIQjU
 oj9nJGlMRpOXA1LrX9nqtvxwmcyc7rldro3Nh9PzetBHX3s+g1F9DihSobKGLPG9VYy/sgg2j5
 oP1D6iXZfkANr3jGMsAAAA=
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, 
 Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7134; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=q0l6SoLkv/OD4ArhEhudd5OJ0i0bPlCDCgP82G86E4s=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHiaF06kiMa1Kiy0zbuyNSVT7qqLeOaNk6YykAxei6
 u9/fbato5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACZy/Ccjw790801hQT1c4sK/
 Pym/+tP+PHPu5KvHDoWXmPR5P3bMncbwz+hu34eN54tOTEkwuCf9xntq0dXV6aYeZVzmuXPOJHU
 pMgIA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

This series builds on Andrew Jones's earlier RFC [1]. It lets
userspace check for RVA23U64 conformance in one call, instead of
walking hwprobe + prctl across every mandatory extension.

The series adds a small framework that resolves profile-class
bases (IMA and RVA23U64) from the kernel's ISA extension bitmap at
init time, and surfaces the result through both /proc/cpuinfo and
hwprobe. Later patches can add RVA23S64, and backward RVA22 / RVA20
detection, to riscv_set_isa_bases() without changes to the
surrounding code.

Changes in v3 came from these sources:
1. A rebase from v7.1-rc2 to v7.1-rc6;
2. hwprobe.rst clean-up is moved to first;
3. Zic64b is added as a first-class ISA extension (dt-binding,
   cpufeature parsing, and hwprobe export);
4. Resolve review comments from v2.

V3 Series outline:

  1-3. hwprobe.rst clean-ups: normalize indentation first, then
       document EXT_ZICFISS / EXT_ZICFILP, and standardize single-letter
       extension capitalization.

   4.  Zicclsm: cpufeature parsing + hwprobe export.
   5.  Ziccamoa, Ziccif, Ziccrse, Za64rs: cpufeature parsing + hwprobe export.
   6.  B: cpuufeature pasrsing + hwprobe export, as the Zba/Zbb/Zbs set.

   7.  Zic64b: dt-bindings, with a schema check.
   8.  Zic64b: cpufeature parsing + hwprobe export.
 9-11. dts: Declare zic64b in the SpacemiT K3, SpacemiT K1, and Sophgo
       SG2044 device trees.

  12.  riscv_have_user_pmlen(): arch-level accessor for user
       pointer-masking PMLEN support, used by RVA23U64 detection.

  13.  cpufeature: per-hart and host-wide isa_bases bitmaps,
       populated at init time. IMA and RVA23U64 detection lives
       here.

  14.  /proc/cpuinfo: print "isa bases:" and "hart isa bases:", eg. rva23u64.
  15.  hwprobe: expose RVA23U64.

Tested on both K3 Pico ITX and Qemu with -cpu rva23s64,sv39=on:
  - /proc/cpuinfo reports "isa bases : rv64ima rva23u64" on both the
    aggregated and per-hart lines.
  - hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
    BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64.

Based on v7.1-rc6 plus [2]; happy to rebase onto another tree if needed.
A branch is available for all patches in the series: [3].

Note: [2] is only required in order to save the merge effort for adding
      'Zic64b' and 'Ziccrse' into the same k3.dtsi.

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: https://lore.kernel.org/all/20260602070257-KYC5031219@kernel.org/ [2]
Link: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe/ [3]
---
Changes in v3:
- Add Zic64b as a first-class ISA extension: dt-binding, cpufeature
  parsing with a validate check, hwprobe export, and device-tree
  declarations for K3/K1/SG2044.
- Patch 1 is now a clean up of hwprobe.rst indentation.
- Document RISCV_HWPROBE_EXT_ZICFILP alongside ZICFISS.
- Move the Zicclsm hwprobe.rst entry to the IMA_EXT_1 section to match
  its bit allocation.
- Collect Anup Patel's Acked-by/Reviewed-by on Patch 3, the capitalization.
- In cpufeature.c, set the local ext_mask with __set_bit().
- Update Guodong Xu's email to docular.xu@gmail.com.

- Link to v2: https://patch.msgid.link/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com

Changes in v2 (since Andrew's RFC v1):
- Rebased onto v7.1-rc2.
- Reworked rva23u64 detection into per-hart and host isa_bases bitmaps,
  shared by /proc/cpuinfo and hwprobe.
- Scoped to IMA and RVA23U64 (RVA23S64, RVA20/RVA22 cpuinfo output deferred).

- Link to v1:  https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com

BR,
Guodong Xu

To: Jonathan Corbet <corbet@lwn.net>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor.dooley@microchip.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Shuah Khan <shuah@kernel.org>
To: Anup Patel <anup@brainfault.org>
To: Atish Patra <atish.patra@linux.dev>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Charles Jenkins <thecharlesjenkins@gmail.com>
Cc: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: kvm@vger.kernel.org
Cc: kvm-riscv@lists.infradead.org
Signed-off-by: Guodong Xu <docular.xu@gmail.com>

---
Andrew Jones (4):
      riscv: hwprobe.rst: Make indentation consistent
      riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to cpufeature and hwprobe
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support

Charlie Jenkins (1):
      riscv: Standardize extension capitalization

Guodong Xu (9):
      riscv: hwprobe.rst: Document EXT_ZICFISS and EXT_ZICFILP
      dt-bindings: riscv: Add Zic64b extension description
      riscv: Add Zic64b to cpufeature and hwprobe
      riscv: dts: spacemit: k3: Add Zic64b ISA extension
      riscv: dts: spacemit: k1: Add Zic64b ISA extension
      riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: cpu: Output isa bases lines in cpuinfo
      riscv: hwprobe: Introduce rva23u64 base behavior

Jesse Taube (1):
      riscv: Add Zicclsm to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               | 239 ++++++++++++---------
 .../devicetree/bindings/riscv/extensions.yaml      |  20 ++
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 128 +++++------
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  80 +++----
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  48 ++---
 arch/riscv/include/asm/cpufeature.h                |  14 ++
 arch/riscv/include/asm/hwcap.h                     |  24 ++-
 arch/riscv/include/asm/processor.h                 |   4 +
 arch/riscv/include/asm/switch_to.h                 |   4 +-
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |  10 +-
 arch/riscv/kernel/cpu.c                            |  26 +++
 arch/riscv/kernel/cpufeature.c                     | 182 ++++++++++++++--
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  34 ++-
 arch/riscv/kvm/isa.c                               |  16 +-
 arch/riscv/kvm/main.c                              |   2 +-
 arch/riscv/kvm/vcpu_fp.c                           |  20 +-
 arch/riscv/kvm/vcpu_onereg.c                       |   6 +-
 arch/riscv/kvm/vcpu_vector.c                       |  10 +-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 21 files changed, 586 insertions(+), 296 deletions(-)
---
base-commit: a04586b3d291a349301c2463bc485d05a3968383
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>

