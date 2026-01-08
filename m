Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30EA4A7E47
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 12:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875170; cv=none; b=Dkk7peplIGG4LZStdh/eC8K1yAlnfC19pKVNR9etnWkeTlFVkREbb2NAdUKQnXFV/DMtGZI0jzMEG07IoOWyywsNM3Duq+ng+kC0mQTxKH0NTQTabAIbOysT7VrzTrAaNmgcOHl6RkCrBMnGb7FnvlsZvbOl9iwTU/FDxOuLAhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875170; c=relaxed/simple;
	bh=aPxeXi1YVSvYsu5/uu1m/VJK0dQbMLYTBSCsnYLUogg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mTr3kiSVGOE2HArU6w/DUbpHADXl9SQeLXyzVH2fEYiBJUw34lnHhtur5VlQQNtT6p12i7zBafpa0dRASlOyXUk2yagqALA039HSWenI+HaqIW9NPoKTltaO2GrjuKIPx7x9sWTHZnfDDULPZLntp/pN83XduCskQ22amVHAdOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JVcLYfpK; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JVcLYfpK"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-29f30233d8aso24031645ad.0
        for <spacemit@lists.linux.dev>; Thu, 08 Jan 2026 04:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875168; x=1768479968; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5a5Cmx6eSpgB6FweLtrTLFy8CMWvSpkFBSClkOyo2G4=;
        b=JVcLYfpKk1uq9kzGpp4NQHOmrGnQXb2CVZRHo825EBvdFmp3JP1IQUAZQ5GAoSa8Nu
         bmUiPzzbNaKcIs/o6eRcU20EdebIowWRYdrqkdrzXHQvixe0q728CD1cB+CbetRJ4Lqs
         /aHFIL66EcNmpRRP+8QlP1KLrAFCm6Zw8IOLr1Oqwjb/C9eGhgXD4G5q7jxyrVno3dmW
         XcsCO56OUHeQveeCo+SHNC2jEdtdYE4dM4ANT5Zblvi09Bgw8YiLhNIbCZZacjvNUtCj
         QdXfwK7zZekPc+Nt+DUfiymjTQvdmgjWLvNvBv4MORGMZLrK+iiWlWrC39HCg0fQa4pa
         Ghcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875168; x=1768479968;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5a5Cmx6eSpgB6FweLtrTLFy8CMWvSpkFBSClkOyo2G4=;
        b=ZbKF0HzuIFr3rqZZSQYeySMHFENQuBiXtWRynH3WMTvd0uFEFra9BemiCB59fMXrgL
         Y4PzCGAWhARIhyS72tuludLf6eKK/3lPGdBH4FGjECHwUfGBgua0DQFgGRuI4qkWG4Ro
         RgwijVR08s/2RdcvQkELGvjIGzE/iz9OiFK+gXrvsnaxbmTe8x/UIB9UHTy7uhdNrHQZ
         1u7NUt2IxbrEPCUBPIU401Z8kbGQG7Xb2zCcycqnhj5su81jiDcR4dSfCIioTbEEIuEU
         O59e7VwzEPxtrWThDxm5gznFG/Yap2QoWikYQn5V2t6zL0Nqb0XMv63LBm2CDm63Rtby
         +W3w==
X-Forwarded-Encrypted: i=1; AJvYcCXTfKlBhm500x1LF19lQS+NNXSviHwuQ0bIInA6Ri+Xs+SnF3svLZdBn47G8VLSAVqI8IpT59f88w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwV30Cls8vKKhzkULIBivOOnc3ybeNQoBEeObnWu80+bVa8bg50
	uzlV1jRs/00PiQU9xa+k1H967YwsBUG+4QN3By7hWDAqgbyzGibDfHUjDQjHCt2mfd8=
X-Gm-Gg: AY/fxX4miJs8/BDDn6B6rz12jtsrRnpA0FHcB31SVobgFq8ackFn2lzA2KoPeG2bKD9
	eblA/irHyWDRzLEql/PZHAL5XdiGQ9doQSdhPACZ3DqT12Iw2l2NcebSG3gc5+4Q8FM5yr26h9E
	sqAN2VmzgtPz9ubzvJ2KjTAMJ3iQSDw6suEoWYqBV5BIJsreFox0ROWTj3f3AwpUolH4u7rsX+9
	x8aXzqWxaTfAhLmvbWMnAwanacoE+WVcBgvTnAfhOcwDXTa9LQhauy2Ko0mZIbBm8EmKE5r/GjB
	lviwbu5UhQWmwkGTsWFyCy8UqUEbVzrji11Pg4bWWCt8bCuSSj/oWbxOd3H6sk2hONsnKX1EnQS
	mNzgzHggDJRbwPmWhxBTLjQD4cYRO14SHZlFjfolIJoGz9/6mQYObkSpj4bEc6qoZDUfiA+f8xy
	WO7TnW/j7JfBcg9md9jC85p9rmBtvazbs=
X-Google-Smtp-Source: AGHT+IG5WlQCcSrpKjtmrTKSuTso7FBs91pigsQBNziZVwp1qYR1+jHUes01I7ZrZxHGXnTVwt7C9A==
X-Received: by 2002:a17:902:e5ca:b0:295:5dbe:f629 with SMTP id d9443c01a7336-2a3ee433154mr49122985ad.8.1767875168169;
        Thu, 08 Jan 2026 04:26:08 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:26:07 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v3 00/11] riscv: spacemit: Add SpacemiT K3 SoC and K3
 Pico-ITX board
Date: Thu, 08 Jan 2026 20:25:51 +0800
Message-Id: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+iX2kC/22PQU4DMQxFr1JlTVDidELCinsgFh47oRZqpyRhB
 Kp6d9x2A4jlt/We/j+ZXpqUbh43J9PKKl2Wg4ZwtzG0w8NrscKaDTiYPPho34KdsQtZHpY4T1v
 nos8pGyWOrVT5vNqeXzTvpI+lfV3lq79c//es3jqLjmGKlJkyPDXp1Ae2e1r25qJa4QcO8BsHx
 QPWUAOxqwn/4OdbtVbeP3TfuPUziher/70M3QtQyUPeZoY4JcZEcYYUY62VZs+ID4zOZ5WdvwH
 Ew//JNAEAAA==
X-Change-ID: 20251216-k3-basic-dt-cd9540061989
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2

This series introduces basic support for the SpacemiT K3 SoC and the
K3 Pico-ITX evaluation board.

This series (starting from v2) also adds descriptions about ISA extensions
mandated by the RVA23 Profile Version 1.0 into riscv/extensions.yaml.
There are extensive discussions about how to handle these new extensions
in v2. In v3, here is my best understading of what I think we have reached
consensus on.

The SpacemiT K3 is an SoC featuring 8 SpacemiT X100 RISC-V cores.
The X100 is a 4-issue, out-of-order core compliant with the RVA23
profile, targeting high-performance scenarios. [1]

The K3 Pico-ITX is an evaluation board built around the K3 SoC.

From an RVA23 profile compliance perspective, the X100 supports all
mandatory extensions required by RVA23U64 and RVA23S64.

Hi, Conor

For the binding riscv/extensions.ymal, here's what changed in v3:

 1. Dropped the patch of adding "supm" into extensions.yaml. At the same time,
    I will start another patchset which implements the strategy outlined
    by Conor in Link [2]. I understand there could be different opinions
    and anyway, let's move the discussion about "supm" into a patchset of
    its own.
 2. Dropped the dependency checks for "sha" on "h", "shcounterenw", and
    6 others. "sha" implies these extensions, and it should be allowed
    to be declared independently.
 3. Enchanced the dependency check of "ziccamoa" on "a". Sepcifically,
     - added the dependecy check of "ziccamoa" on "zaamo" or on "a".
     - added the dependency check of "za64rs" on "zalrsc" or on "a".
     - added the dependency check of "ziccrse" on "zalrsc" or "a".
    The commit message of this patch is updated too, to better explain the
    relationship  between "ziccamoa", "za64rs", "ziccrse" and "a".
 4. Enhanced checking dependency of "b" and "zba", "zbb", "zbs", making the
    dependency check in both directions.

Thank you for your review.

Other Changes in v3 include:
- Patch 1:
   Acked-by: Krzysztof Kozlowski
- Patch 4:
   Acked-by: Krzysztof Kozlowski
- Dropped Patch 5 "dt-bindings: serial: 8250: add SpacemiT K3 UART compatible"
   as it has been applied to tty-next.

The entire series now rebased on top of tty-next (tty.git), which now merged
with v6.19-rc3.

Link: https://www.spacemit.com/en/spacemit-x100-core/ [1]
Link: https://lore.kernel.org/lkml/20260101-legume-engraved-0fae8282cfbe@spud/ [2]
Link to v2: https://lore.kernel.org/r/20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com

Changes in v2:
- Patch 1:
   Fixed alphanumeric sorting order of compatible strings (swapped x100 and
     x60) as per Krzysztof's feedback.
   Update commit message with more information about X100 featurs per
     Yixun's feedback.
- Patch 4:
   Fixed the order to keep things alphabetically.
- Patch 6:
   Use "one blank space" between name and email address.
- Patch 7 ~ 11:
   New patches. Add description of RVA23 mandatory extensions into riscv
    binding YAML file.
- Patch 12 (Patch 7 in v1):
   Removed aliases node.
   Updated 'riscv,isa-extensions' with new extension strings available
- Patch 13 (Patch 8 in v1):
   Updated the memory address to the hardware truth.
   Added aliases node in board dts.
- Patch 1,2,3,5: Add Reviewed-by and Acked-by collected.

Link to v1: https://lore.kernel.org/r/20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (11):
      dt-bindings: riscv: add SpacemiT X100 CPU compatible
      dt-bindings: timer: add SpacemiT K3 CLINT
      dt-bindings: interrupt-controller: add SpacemiT K3 APLIC
      dt-bindings: interrupt-controller: add SpacemiT K3 IMSIC
      dt-bindings: riscv: spacemit: add K3 and Pico-ITX board bindings
      dt-bindings: riscv: Add B ISA extension description
      dt-bindings: riscv: Add descriptions for Za64rs, Ziccamoa, Ziccif, and Zicclsm
      dt-bindings: riscv: Add Ssccptr, Sscounterenw, Sstvala, Sstvecd, Ssu64xl
      dt-bindings: riscv: Add Sha and its comprised extensions
      riscv: dts: spacemit: add initial device tree of SpacemiT K3 SoC
      riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board device tree

 .../bindings/interrupt-controller/riscv,aplic.yaml |   1 +
 .../interrupt-controller/riscv,imsics.yaml         |   1 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   1 +
 .../devicetree/bindings/riscv/extensions.yaml      | 169 +++++++
 .../devicetree/bindings/riscv/spacemit.yaml        |   4 +
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |  38 ++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 548 +++++++++++++++++++++
 9 files changed, 764 insertions(+)
---
base-commit: 322fc12949d2658da8c6b2866fffcb1daa7da019
change-id: 20251216-k3-basic-dt-cd9540061989

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

