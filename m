Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6F72222C5
	for <spacemit@lists.linux.dev>; Wed,  4 Feb 2026 13:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211392; cv=none; b=HtmTWAeqqed4Qkz/aLNKNR1lzZUgIUitRIo44pkHu5y6lNpcVt6akhE3Y+8sjI+tkpjfs1zMNbSmjQGnQICi8LwvTl7cHW1DY2ZuN8MdfuNg6zpEZ3I3+MPzptOWYMjacs4Jv/nUbmy6Nv7MvqBxroOoIYqbBMUxHic/T9KBnXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211392; c=relaxed/simple;
	bh=c68fJ7OMpslbItdQ9xgxFuKoYGVE3+0L9MTCQlxzlhs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bilp2gu1EduYQJ1oFl7Ve5n+s19b5tgNfVyeBYNnFUGBSKqYxRqNEHflVEjI/3jvVCW6xXecHnDpgkBuI0V/PxZFsdx7Rf6Tw9IpQcfkh/mMo+k7MfdJT0Pf55lp84aKpHjEXGM4jlMkpFpW4sXt/PDf5n6yTIjzMJk82hmFy2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=EPtj7wR3; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="EPtj7wR3"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b7381d2d95so472990eec.0
        for <spacemit@lists.linux.dev>; Wed, 04 Feb 2026 05:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770211392; x=1770816192; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kIfSdKgtKPIDZe3e+f9p01Ulu42xE4j1piPC/F3kvqE=;
        b=EPtj7wR3XC6OMImlsz/XScmx3QBZ8rm1axUoGvP+EsPjwrtpCnhaLjZ2aKApaLuF0y
         HQONEEzEfRh4aVvdOtGzN5h4t6VsWzX2wqvwro8wbdBnLWMWwJcuPO3ZYNRUhbTi/Thb
         wtpqQ3MCIhnSjZk2G89Lsd4oiO4+Kcop0YCzAUsIN5FbGyIbosTPWx1dMWDMmW7POjai
         IrrWimf04e0ytkHMqfNWcAv4gQJrSjOvZB3cxFaI+MSdKVxy57f+CWstER8Deza4oSaC
         mpVexmutrZchLjFvry6AP27e9UZ9QKFyL5Uscrr+Mj/AwebM7BXSX06GqIQEAgIIx+Ou
         KvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211392; x=1770816192;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIfSdKgtKPIDZe3e+f9p01Ulu42xE4j1piPC/F3kvqE=;
        b=kMCz2gortctfW1cS5bT9jFScn7j2WWTUKTpzWKHGbtLRe09XgwEh8dLnVEudO8UH63
         1CZxLk/iY5hREk5mdfwHcR6E6vY2hhscl+vZnxAyAHS12fB9o5OFHiJwLIKhKmDoizSY
         VW1R8pGcCdmroB68V2MgjcO/pW7W9Q27vUKuIRaRU6EUb71OEX64uUejjArLxOF73RRp
         mnAISF3tY8mekdCq7uBZDOg3Ug/8ZUS8isqz2HVNH5RJzJB2IWmurMPjM2BiXNe4i9dS
         2v37yUOqedzJ2KTSlGjiYs0Xg7gD9wiOEp/ErybgUoJgbelBbvO4B9Rq5CbIMFazzx7o
         A5BA==
X-Forwarded-Encrypted: i=1; AJvYcCU2w24J4VpgJtRs0aWWRsHv8FervRS4ONXkYP4hE764IIdmf56WLor8vK67AXvFEdbyF7kGNb6OQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPBbUKejML4apbDtjqjzzpRaTDaONlF6XfXTcNQznSk56qgN/W
	aOONtxlUjWG3gJIU2MNw4TwmQK/HGMKojByVSc0B0B+Saj6WgonDQi/iwYQDw4swfnc=
X-Gm-Gg: AZuq6aI3V2KFkne6dbT3L/GOy5iEiX1XqvKFllY8QptR+0PgSAb97cyQWI0huVjA0GQ
	Irqd9bwznoKYhxBCLPP5pWw8/FlaBTjcwqQb9TjK/lKH4HQoz3lVjOOAS2w76oax+Vh4nNJrHDR
	zZQz/aSsGmovS0Dtymm6IIv0GCUhyLU3OQKfv8y5KBnuV1BQht+inNrly6eO6QdJDxvzLBLVENS
	wDmFgpxyOL52S884w6AJdigwZW4tsvQ7w79tWI03AU+5c8/vHoe6Gjqpi3cfAOFbkywA7bNQuAU
	o3XSPJ9PePsSndiTqzRkova4YeliO2QiupBeq7gv7Xe9kbk4JrK5CZbjWgFbeeOed1t9X1vDMps
	hmYkSXFJaQOoWv7pGLAhhQIYJURiWykuzLu+ajQaOWBT7S+W0zOwsts8NcBy/3ln5iHQrOIef5q
	8sRZnihV0zKqEITfrifYk1NnNpEXtzH2Y=
X-Received: by 2002:a05:7300:7301:b0:2b7:1dd3:585b with SMTP id 5a478bee46e88-2b820e47fe9mr2509188eec.7.1770211391556;
        Wed, 04 Feb 2026 05:23:11 -0800 (PST)
Received: from [127.0.1.1] ([2604:a840:3::303d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fc1d50sm1416731eec.27.2026.02.04.05.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:23:11 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v3 0/3] regulator: spacemit-p1: Support board power tree
 via DT properties
Date: Wed, 04 Feb 2026 21:23:00 +0800
Message-Id: <20260204-spacemit-p1-v3-0-a894b3057026@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADRIg2kC/22PQW7DIBBFr2KxLhWMGQxe9R5RF4CHmkViB6iVK
 vLdS5xNW3X5v/Ten7mzQjlRYWN3Z5m2VNJyaaF/6ViY3eWDeJpaZiBACwnAy+oCnVPlq+SO0Gq
 KZAxG1og1U0y3w3Z6f+ZM188mrc+Sra6GuSnHTqLyk4oDiEAoNE5ovDVmIhNh6EEMXikcgB5e7
 wrxsJzb7Nih1IosYkN69liZU6lL/jpe2OQx8++1m+SC98J6giH6GO1bTiWU6vJrcx+qDX7i6jc
 ODYdgtBdaW+XdH3zf928xwq3dTgEAAA==
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
X-Mailer: b4 0.14.3

The patch (Patch 1 in v1 and v2) fixing hardware voltage constraints was
applied to regulator.git for-next, so it is dropped from this series.

Patch 1, 2 and 3 (previously 2-4) enables flexible power tree
configurations for the SpacemiT P1 PMIC. Hardcoded supply assumptions
are replaced with explicit devicetree properties. PMIC supply connections
are board-design decisions. Moving this to DT allows supporting varied
topologies without driver modifications.

The supply binding change is an ABI change. The breakage is acceptable:
Yixun Lan checked the DTS tree queued for v6.20 and found no consumers
of the P1/PMIC regulator yet [1]. For the two K1 boards in-tree
(BPI-F3 and Jupiter), initial power settings come from boot firmware and
a probe failure of pmic node "spacemit,p1" has minimal impact.

Link: https://lore.kernel.org/lkml/20260125110333-GYD71302@gentoo.org/ [1]

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

 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 53 +++++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 12 ++++-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  | 12 ++++-
 drivers/regulator/spacemit-p1.c                    | 25 +++++-----
 4 files changed, 86 insertions(+), 16 deletions(-)
---
base-commit: 5164e95565d3fd508ca8a95351323f5716dfb695
change-id: 20260122-spacemit-p1-ae596efe885f
prerequisite-patch-id: 154bd4f720ce5065d58b988de8f273207b44572e

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

