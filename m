Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE35310652
	for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785022441; cv=none; b=rKcNGM7FiPjLSGzY6qhmgkqS60pL9ne1Ol2U3f+YeFBwpIV3vTdVCTUDTCakGt/vmMDqB+pFwmxVFMLs2DU38Tv+3yJHKpZ27g/pyi+cI97b33s8jTB64ki0ncgP48sJ7mv2D/7/+ltUpfufLfw94fCNm2DOwMWV2fHth4fB2ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785022441; c=relaxed/simple;
	bh=CWuNqTa1Di5xbCXotLCoazjjEqZ0QEGdVNvasAZYVrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z/JLIE1T6KtwqabV+hGrXmcamqhKqvf3tckbQS3XJs7kXvoqlIwbCEafNeEWGdoXH4rVRpMecHePP4rfzlcVSgQX+Afq7TrnNi4A7/h7cqOeDw3crDP18ASlz/QfWjKAliQUH1lC2UCMU02JtLngZSFaO0CI6X0qwk9dHk3GXW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ul6njfFk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ul6njfFk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso16786625ad.2
        for <spacemit@lists.linux.dev>; Sat, 25 Jul 2026 16:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785022440; x=1785627240; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZe3o6MEZnJBcnhQqox2Guu7ytbKOYx/UVedKiDOk/8=;
        b=Ul6njfFk1ibKXFnuHgehm0ajYNRyyj2/sBBAU7RPdJTOE6y5dE6gBzOrGXnFcy6VYc
         sS4xzoND4mhqXi1iEM1BpEqYruC1ejtDjvXavSNTjjq+6QhHCvh6AzrMQEKj0Zoz7iX3
         NjJfdFc8lF5veQSo6Z47CnYrhiWNQZqL07peKNCHxOIbBO0qoUnvUszMJ6zb+Lq23Ca5
         VIXnGPHe5bTAMA3hzZLkku//ZsGsoU7USYEt5dSNbRg1/gv77P2ysj/kQliVeubJV5d+
         2RWxxE8ZRKwL2T1uat+/NAqJsAatgZ5ftXdbfcYjBnR9tY+b3JBZdutHpCJCp7ef30gr
         GgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785022440; x=1785627240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZe3o6MEZnJBcnhQqox2Guu7ytbKOYx/UVedKiDOk/8=;
        b=V7Y4VFsdwl5dmlDAqXfChLnEcUG1iTaJWVkwENVfj7bB4OK1m0kOhk0/luBbEvZTtT
         hFOIs7clGfXb/Pd24ck+AOwpNbnHhUUuTNxuRNvyEbukLE0JJ8BrTmbbffSogWtoIll+
         CAmJ3Y+chOJnoRCIEhJuhRqrjhSQRQudlhbZ/tqz15YJjIRr4tj4e0h0thuN60H7ii/I
         s1QaLWSuJ1T2JZ4J48x1FK9Dq2MwDRtOdRK6VOpBL8vgHydZegPiogcLVH/jzTSZwRXc
         yJsSDoyJwEb7g87JF0p+WGNF2Nu+6Lhca+4AInunL9sniDVW/EqslWiPGV0em9QNDq6I
         4qRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFkIzPNxtTkUrxg9jxvyjztjwmSssJW4pJ8qILDS1LT9eXc6IDjKXbVVMsNY805t/cH1IfEDl3Sg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/uEFc9DvG4pevxhapJZBIxA5Oj3IPxTFRVDgohKs3ydFh2b9A
	oeppaiO4SC9YP5NUlLFS4Uq/GC2n/BAjUxaLx43QNELNPUt6vzSEQpx0
X-Gm-Gg: AR+sD12dlzHslB7n+pYqmFPAnpFcEMg5gqDYhDX/BCbiKAHcPRGepH/eedYKgInXNPm
	X/1/XBdnB1L2rzm/PZndG84oEx6a4A/slLomKyyoQkYA9kPi7EpkZmmFgYN5n5pkaA/dh+9Oh/b
	bhySYIrkPoxRaKCnjXWaXqzEQwfOT1i7FwbnfNiF733VpltiwWgOmBDdISt8lNA83VOF2dr7WIL
	8gBt/jBuQ4rWHtyosjjwhKJTT7doHvJsukkLX81rN06WbJec7Ltl6Znu+VLCIekUpXDplX8urAZ
	C82AGKglvbLjclk5Zd/SpEkCZXcEUCPTt30WDaRJE6DqMwK9DC3qoXHqci/unj2QUMf6+ttB1e4
	9bD8Dg9MPTWyJ8tnu0jj7WMYPbmB3Ilnh+7ZXFKOIp2DfXY2w6gwAOfsq+zQZndIgClaalnlE0C
	Q0
X-Received: by 2002:a17:903:3803:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2cfde55df36mr33858585ad.0.1785022439897;
        Sat, 25 Jul 2026 16:33:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59bb2asm13811605ad.10.2026.07.25.16.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 16:33:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: Fix phy id check for the phy
Date: Sun, 26 Jul 2026 07:33:48 +0800
Message-ID: <20260725233351.55004-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported, the phy framework can not detected the phy id correctly
when re-initialize this. So add the phy id compatible string to the
etherenet phy, so the phy can be reinit successfully.

Note: separate this patchset as two patch for backport if necessary.

Changed from v1:
- https://lore.kernel.org/spacemit/20260725005804.373698-1-inochiama@gmail.com
1. Remove all the c22 fallback compatible.

Inochi Amaoto (2):
  riscv: dts: spacemit: Fix phy id check for the phy on pico-itx board
  riscv: dts: spacemit: Fix phy id check for the phy on com260 board

 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 2 +-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.55.0

