Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C478235BE2
	for <spacemit@lists.linux.dev>; Fri,  6 Feb 2026 02:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770345142; cv=none; b=GRyL0AI9CEX7kyEy3A8c45V8F/wfEGP6IO9YM9u9fa5aoU4CW8iRZkea/ziH6b6BNznN4WQJXmwKjEAlsxIAkHHzigQB2z0Ple8hVP0uFimxFdUkHftimhy6Julx+6ppFyptsj9+TUIJh1g0jsrPFRlY/Kpg2rqv4lFXOhC5ZaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770345142; c=relaxed/simple;
	bh=8Vw1pU0PF8xf3HXr9YA8x1cCFIwTu/dwwQOjdfVYzq0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jBiaN+7ViYNVhJ+ftsmepbDnCfmRueyzCVyGlz6YEVKobtVYbpMo48ooly6XJLp3EMWvL/jWJ5xjP5iCOGf0tlGyXETXmypgPddmo5d1o2UDdRmmqXftiQ+qQGpjKA1KBj5J9vrFVO7O8jVCE5Jbkhbv/9MKLT0KCfHbUPpugvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DZ0iza9d; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DZ0iza9d"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c227206e6dcso928312a12.2
        for <spacemit@lists.linux.dev>; Thu, 05 Feb 2026 18:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770345142; x=1770949942; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rTv5aR1WBOedsI7siHmth1ku2vaQ77x2+ptDw28qK8s=;
        b=DZ0iza9dQcV3ARG6cxVhncDT4WIWpKEKdym12SuQnLW4lWiL9y/Rxc9ab3n+hG4gh4
         +1HuyJMoShXWiX2Q64T4DIglUgzb6XBgavs4TshGfccOc6LAx99gH8KfCAi6LUo7URNu
         2liklk9eYA7cIfkNdUEw1RJchLxNVi+ESztPR8CKpLg3X5Hehc/ahOUAFIXAIL3bnlmI
         R3BC6Bk4sv8RJxdYkAo9LrsCnuHBPOiZDGfgOmpdKHCJC9OYyw87jjFBSRRGDlFWsIr2
         hR9b44JLvh+CXpyHU4fUAqGQW0YfXbvvf/6FXExRAR8DZi4QbjCgeDSvF+2vp9bWluDy
         mVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770345142; x=1770949942;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTv5aR1WBOedsI7siHmth1ku2vaQ77x2+ptDw28qK8s=;
        b=WajqlvQQAToi/keR3PH4QkNzsW4OyDJ75CnyuCwfPWS+6++1/H2k1qdZ2iS6BpdIXE
         mr6wvnPszbqaaPAv9FaLZ8LdzTCq+AX3bZ1M+xBR6/80QSPgpX8wkBZ4OMOx/ttFxGTV
         fySBMjyCJm/jDwJEH2NUcp5iX006XUTYOFfL9/yDOBLbxi7q5p7NuU1wo1kLAtg+7XQa
         FdwEz75gvZUnbx5iCSYtiR6Fqz1ufUci+bvBrI8docGaG3pJMMuHZYGuloUqRy4+C7Sa
         mXnMgLWia1jmRhT1Q9U4lL/PooHi7sSdlOaAUywo3gyp5j25C5G2PwlfjZT36DIm6JER
         Xpmg==
X-Forwarded-Encrypted: i=1; AJvYcCUnXTGHLoTtIRbc7BAa3o5AGSP46qwBvj5qAOdqGSy7JRBt2q7apYQdpQZAfU1S/sbg1bCt/R29kw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyQZBe2fbJqdWZHc4l3ekdBaMFYsx6hm+yyfGnphzNv1RK4Fyk
	H2sV0Pz33wsgzvz+KBTp6imS7nMjZ9mRogCm6A5rPskKlEAhqwjwBy5ba4ev715Hx6Hq0dUt87P
	vE+U4tiDIuw==
X-Gm-Gg: AZuq6aKLA+04Lp6+AHc12GVgXZpHNj7oNQZQsL3P4z8yUpGVC/+uC8cpjFeQEJhr2l0
	v9O6tRw9GX354nANDNlZPKEQsMhPApafNps+KK5HeCKdakUCrhsZS34aTErGPsfHkF8aHYi5rMB
	a4g9ivsJqp6F1eZtNQCfa6yymgfeHJkr/6uQFHfRNasqhihb5vhkpfSHAg12pS2egbfXV2C8TfX
	N2NTYwqWr4R2H6FuOpxNPWYkvI8I5SnIU51hWiCyHqqPThpGqD89m3BuGgow/lV8hadu1/+EVdU
	dtmLeey7cZxKJhGl5PA8bJie0Q8akzLnoNEyMUx/xvWhWAjtlGifPWe0g74ynhNHS38Z5sixJS3
	qNPaMA/zfWKFPh256WLZtu+xp4SJvRcqzHPM46hjYT1jjbgJecO8EE3EVP1sQ2x9rPfFb0NvYdC
	+HsNsecalVhWHPvKyzzVngzYRVilILjOKYZLO8/ZIU6IAR8u2vdrK1ds8JYjpgalsBvs9jo4kK3
	Q5NJfZjQDza8xS8Dao=
X-Received: by 2002:a17:90b:1e08:b0:34a:b1ea:664e with SMTP id 98e67ed59e1d1-354b3c8c50fmr1174536a91.15.1770345141658;
        Thu, 05 Feb 2026 18:32:21 -0800 (PST)
Received: from [127.0.1.1] (61-221-120-110.hinet-ip.hinet.net. [61.221.120.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b64a8a9esm158419a91.1.2026.02.05.18.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 18:32:21 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v4 0/3] regulator: spacemit-p1: Support board power tree
 via DT properties
Date: Fri, 06 Feb 2026 10:32:01 +0800
Message-Id: <20260206-spacemit-p1-v4-0-8f695d93811e@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKFShWkC/23PzU7EIBQF4FdpWIuhl/+ufA/jAujFsphphdpoJ
 n1373QW6mSWh/CdAxfWsBZsbOgurOJWWpnPFNRTx9IUzu/Iy0iZgQAjegDelpDwVFa+9Dyg9gY
 zOqczI7FUzOXraHt9u+WKH59Uut4O2RLWNFHl0PVaxVFlCyKhFkaP2kXv3Igug5UgbFRKW8Brb
 wwNeZpPNDt0ujcKvdZEJLuuTKWtc/0+vrD1x8zD1249F1wKHxFsjjn7l1paamuoz9R9VG3wl6v
 /HIhDciYKY7yK4QGXvxzEHZfEgyMohbZ0447v+/4D+GvG840BAAA=
X-Change-ID: 20260122-spacemit-p1-ae596efe885f
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, devicetree@vger.kernel.org, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

The patch (Patch 1 in v1 and v2) fixing hardware voltage constraints was
applied to regulator.git for-next, so is no longer part of this series.

Patch 1, 2 and 3 (previously 2-4) enable flexible power tree
configurations for the SpacemiT P1 PMIC. Hardcoded supply assumptions
are replaced with explicit devicetree properties. PMIC supply connections
are board-design decisions. Moving this to DT allows supporting varied
topologies without driver modifications.

The supply binding change is an ABI change. The breakage is acceptable:
Yixun Lan checked the DTS tree queued for v6.20 and found no consumers
of the P1/PMIC regulator yet [1]. For the two K1 boards in-tree
(BPI-F3 and Jupiter), initial power settings come from boot firmware and
a probe failure of pmic node "spacemit,p1" has minimal impact.

In v4, the old "vin-supply" property is dropped from the binding
document as the updated driver no longer parses it and there is no
fallback logic. Only the per-rail names ("vin1-supply", "vin2-supply",
...) are supported going forward.

Intermittent dtbs_check warnings are expected while the binding and DTS
changes land through different trees, but will resolve once both are
merged.

Link: https://lore.kernel.org/lkml/20260125110333-GYD71302@gentoo.org/ [1]

Changes in v4:
- Patch 1: Drop "vin-supply" from binding.
- Link to v3: https://lore.kernel.org/r/20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com

Changes in v3:
- Drop Patch 1 of previous series, already applied to regulator.git
    for-next (commit 41399c5d4761).
- Patch 1 (previous 2): Mark "vin-supply" as deprecated to avoid
    cross-tree warnings.
- Patch 2 (previous 3): Describe the ABI change explicitly. Add
    justification.
- Link to v2: https://lore.kernel.org/r/20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com

Changes in v2:
- Patch 2: dt-bindings, remove providers from the example dts.
- Patch 4: Added the pmic supply properties for K1 Milkv Jupiter.
           Updated the commit message accordingly.
- Link to v1: https://lore.kernel.org/r/20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (3):
      dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
      regulator: spacemit-p1: Update supply names
      riscv: dts: spacemit: Update PMIC supply properties for BPI-F3 and Jupiter

 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 +++++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 12 +++++-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  | 12 +++++-
 drivers/regulator/spacemit-p1.c                    | 25 ++++++-----
 4 files changed, 81 insertions(+), 17 deletions(-)
---
base-commit: 5164e95565d3fd508ca8a95351323f5716dfb695
change-id: 20260122-spacemit-p1-ae596efe885f
prerequisite-patch-id: 154bd4f720ce5065d58b988de8f273207b44572e

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

