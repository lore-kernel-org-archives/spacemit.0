Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274B348164E
	for <spacemit@lists.linux.dev>; Wed,  1 Jul 2026 12:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910357; cv=none; b=mwGpjjquoaDzBtyFIuIRQfRUBxA/FuvxLkXOjUtsvWDT1ZQY757+lBAImnjllkAXS0y4x/RcSwEm0+PwY7HEEdYAmmk4Vb6GedLSCFQjw8FPf2crK3xEW0Oy1dAkbD1414bg8bYW6eO7rYqvHW11i4TnaUel11vPNyLxhNWlPzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910357; c=relaxed/simple;
	bh=clw0EOfLxOw8mtsU7lPIxvK677hYKTd1sOOAfWfxJ+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UXA4IwY8n/SpX75tMASR00PFURZlR7sppjhHrTQRIh0b0lZsCpZQtywKYTCvbBj4j5JzqpAkhiB1kpYKOHQrfrsZUzRyhFl9fFBRPWyr6XGrzZlzRAhcJKFYvl0h4w2nk7FowK20HmPgYkxfSs0qGqN+Tmm8G1q5+BR1kbfAdKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWZn94lh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWZn94lh"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8478fe07f65so333210b3a.0
        for <spacemit@lists.linux.dev>; Wed, 01 Jul 2026 05:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910355; x=1783515155; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JeCbitpqWG7NX4xrzGZKImDD1kM8ZvDaFxEivFDYFVQ=;
        b=KWZn94lh5WknwUJo/DTnolPfzagXBT6Alsg9/gjH6DpsZFPi8ERK5WUFJMC1dupyTS
         qI8o0KUyRXvX5R+NRVkgG2xmMTadaYtAsgDHsi1/hJ00mTcf+2C5XFmCR/ItT1xixd+Q
         2LhXl8w4mCe4IsVLtUy19OfQ+/4U3e4cYwznDDD3dieWvWadvjRsnMN/jhaCsUgUwuEC
         K6HhFDsxuyz5LsWWt92JKmRyvx5EN3DD0+El5wgh5BSarRRYzeDKb7tE9i/veuOOQ71d
         bm0DgtwhH+RawAt+ec1jwJ42d80UgbCGn7lmF3ULhQW2PFprZbfrp+zUegu2SwHHAe8x
         k8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910355; x=1783515155;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeCbitpqWG7NX4xrzGZKImDD1kM8ZvDaFxEivFDYFVQ=;
        b=T4lJOW6/7CRwOlByXAYB6dM9N4Yf76/UH4sXQOecPvbMfZgysNkjq9Sor1R+6nSDiB
         jwH7oPlb7eTM2nnuBbWxa/bEgSljdfZlYwPRsS9va/gegMRAkKtUkPVjqm4+6mfr7C+f
         4zropc3Ikm85N7Dh2PHxRnW/YHk+Lczj+r1OXfiT6XrLozYki9s3bMtdqx6PEPqV608B
         OrGHVcWDqKLhulD3A7CnQYSOUvNlaHNbM3rDdOfKLCKwy5munEbmCL+wdLX24A5lRGro
         HLVBsKsyQl0Urd8uKv+GnxqvR4Qmjct3qu39AQVZZV1yumpF5bpoexOZT3p33D8yxTM/
         YsKQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSMfngq7wY5YbqFTac3xrybxKXbgwyKKAeNhWcpFtV9YOLEyR4EeDXhGZAzoslPG44+gaDAPBY/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6jsize9+R1QkGXkN1e8MHNM0OgK5qD2oYQ5Ac2OszJobAzVHm
	9v/THYgbPbGkSlGoUMSUwUcT5VTDYvG4d55dET8pT5JEglFszFFUGsed
X-Gm-Gg: AfdE7cmI5vYAhaLdVH404mYdHMjpJXgTkxZf27enEVqbLTOS0MF+3yNHoXGJKJ7WjWo
	wlSLdrPy8LbEtwc7Ie7yuddwvYFvcC9stQbOc6eU9aGx6biFnJ27GNCtVAiDLcAwxdqzIlcglg2
	5d12T97FKn6ACTaHDW2AfLufDr82uTP5NOztTc8LbpgjeWwTKPicvaN7jM6mSAKphaPSwm19aHR
	osUl1xvC6IjVIw9v+ehaWKv6hqnaDcs4YE4Az6+LSvUloEHbumnPuDfL/Hjon9EUeE2yXvgdCsJ
	Tg+MhAxU22ct8UApEx0rjNy3Y2vtBQzeEDsKDm3+UxgGfbHq0Grrt5s1+GETex4/mTIBWb4vZ7L
	9BFzBmN8GosvnGBtU3lpgb2Urq55t7rx2GqMOuL+Ug6QtOeJLqU8BgxvJqnQAaTAg8GgaYff9+W
	FZnYRgua1+7zyFLQM8Q221
X-Received: by 2002:a05:6a00:9299:b0:847:8704:1c54 with SMTP id d2e1a72fcca58-847c07419cbmr1308909b3a.22.1782910355086;
        Wed, 01 Jul 2026 05:52:35 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:52:34 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Subject: [PATCH v5 00/17] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Wed, 01 Jul 2026 08:52:13 -0400
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH0NRWoC/3XOQQ7CIBAF0KsY1mJgGCp15T2MC6DUYrQ10KKm6
 d2laqILTWbzk5n3ZyTRBe8i2SxGElzy0XdtDnK5ILbR7cFRX+VMgEHBJFM0JA1iKJA210vojKM
 JKK+ArUVpjVGO5MtLcLW/PdXd/pXjYI7O9jM1bzQ+9l24P2sTzHvvBs5/NuRhFLiVWiLWvLLb4
 KONvQ4r253JXJLEhymY+M2IzEgJpV4bUELh9nDW/vQx8Mv49wpmQ9SMa0AsUalvY5qmB/vY9oF
 TAQAA
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
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
 Qingwei Hu <qingwei.hu@bytedance.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7202; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=clw0EOfLxOw8mtsU7lPIxvK677hYKTd1sOOAfWfxJ+Y=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3ibBuQlLRO5Iir2Xy9ZNzjX0Lsr5ZnqiosC1/v7Na
 2csrz7tKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIns9GT47+au1G12duU7n6fJ
 +VWn06qLt6x807xO3qm/SmfC3ckLixj+im3cdP7hprcPTArvWK4QUF3ZPKFDMi9Kbrb9f1PTo0u
 m8gAA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
check for RVA23U64 conformance in one call, instead of walking hwprobe +
prctl across every mandatory extension.

The series adds a small framework that resolves profile-class bases (IMA
and RVA23U64) from the kernel's ISA extension bitmap at init time, and
surfaces the result through both /proc/cpuinfo and hwprobe. Later patches
can add RVA23S64, and backward RVA22 / RVA20 detection, to
riscv_set_isa_bases() without changes to the surrounding code.

Series outline (v5):

  Housekeeping, clean-ups:
   1.  dt-bindings: sort the multi-letter Z extensions alphanumerically.
   2.  hwprobe.rst: normalize indentation.
   3.  hwprobe.rst: document EXT_ZICFISS / EXT_ZICFILP.
   4.  Standardize the single-letter extension macros to uppercase
       (RISCV_ISA_EXT_a -> RISCV_ISA_EXT_A, etc.).

  Per-extension cpufeature parsing + hwprobe export:
   5.  Zicclsm.
   6.  Ziccamoa, Ziccif, Ziccrse, Za64rs.
   7.  B (the Zba/Zbb/Zbs set).

  Zic64b (new first-class extension):
   8.  dt-bindings: require a cbom/cbop/cboz block-size property whenever
       the matching Zicbom/Zicbop/Zicboz is present (new in v5).
   9.  Zic64b dt-binding, with a schema check.
  10.  Zic64b cpufeature parsing + hwprobe export.
  11-13. dts: declare zic64b in the SpacemiT K3, SpacemiT K1, and Sophgo
         SG2044 device trees.

  RVA23U64 base detection and exposure:
  14.  riscv_have_user_pmlen(): accessor for user pointer-masking PMLEN
       support.
  15.  cpufeature: per-hart and host-wide isa_bases bitmaps; IMA and
       RVA23U64 detection lives here.
  16.  /proc/cpuinfo: print "isa bases:" and "hart isa bases:", e.g.
       rva23u64.
  17.  hwprobe: expose RVA23U64.

Tested on both K3 Pico ITX and QEMU with -cpu rva23s64,sv39=on:
  - /proc/cpuinfo reports "isa bases : rv64ima rva23u64" on both the
    aggregated and per-hart lines.
  - hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
    BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64.

Based on v7.2-rc1. A branch is available for all patches in the series: [2].

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v5/ [2]

Changes in v5:
- Rebased onto v7.2-rc1.
- New patch: make riscv,cbom/cbop/cboz-block-size required whenever the
  matching Zicbom/Zicbop/Zicboz extension is present (Conor).
- Ziccamoa/Za64rs: drop the Zaamo/Zalrsc validate callbacks (Conor).
- Zic64b dt-binding: fix a double space in the commit message (Conor).
- Collected Reviewed-by and Acked-by tags in v4.
- Link to v4: https://patch.msgid.link/20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com

Changes in v4:
- New patch: sort the multi-letter Z extensions alphanumerically in the
  dt-binding (Conor), and place zic64b at its sorted position.
- Zic64b cpufeature: validate only the CBO block sizes that are present;
  overlaps Qingwei Hu's earlier patch, so it is now authored by Qingwei.
- Document EXT_ZICFISS / EXT_ZICFILP: cite the riscv-cfi v1.0 tag commit.
- Picked up Inochi Amaoto's Acked-by (SG2044 dts) and Andrew Jones's
  Reviewed-by (documentation patch).
- Link to v3: https://patch.msgid.link/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com

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

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
Andrew Jones (4):
      riscv: hwprobe.rst: Make indentation consistent
      riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to cpufeature and hwprobe
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support

Charlie Jenkins (1):
      riscv: Standardize extension capitalization

Guodong Xu (10):
      dt-bindings: riscv: sort multi-letter Z extensions alphanumerically
      riscv: hwprobe.rst: Document EXT_ZICFISS and EXT_ZICFILP
      dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
      dt-bindings: riscv: Add Zic64b extension description
      riscv: dts: spacemit: k3: Add Zic64b ISA extension
      riscv: dts: spacemit: k1: Add Zic64b ISA extension
      riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: cpu: Output isa bases lines in cpuinfo
      riscv: hwprobe: Introduce rva23u64 base behavior

Jesse Taube (1):
      riscv: Add Zicclsm to cpufeature and hwprobe

Qingwei Hu (1):
      riscv: Add Zic64b to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               | 240 ++++++++++++---------
 .../devicetree/bindings/riscv/extensions.yaml      | 230 ++++++++++++--------
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
 arch/riscv/kernel/cpufeature.c                     | 165 ++++++++++++--
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  34 ++-
 arch/riscv/kvm/isa.c                               |  16 +-
 arch/riscv/kvm/main.c                              |   2 +-
 arch/riscv/kvm/vcpu_fp.c                           |  20 +-
 arch/riscv/kvm/vcpu_onereg.c                       |   6 +-
 arch/riscv/kvm/vcpu_vector.c                       |  10 +-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 21 files changed, 688 insertions(+), 388 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>

