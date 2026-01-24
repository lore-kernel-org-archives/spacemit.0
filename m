Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2831A41C71
	for <spacemit@lists.linux.dev>; Sat, 24 Jan 2026 04:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769228973; cv=none; b=YYfKe62FqhVfF54x5T5jEmTcfuwH4uCuTd01Pm7QFlL9zUwhBJU/1FFdjbTnxCFL9nqw4+9qRrAfhbmvaHJfdEjH1i2m2lkLy0L2rq39nQ2Ss7gkLcwTo6P8k/doKtSygE7l0335dcycJAdquRTKiX1H635H3ObIMwuvp7KRhiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769228973; c=relaxed/simple;
	bh=z4sE7F+fReVLimxlI41zbzg0d+0RXl9Q5GteWlizyGA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SXyzDBBXpymSFcVaO3l1b9KGGO53sA8FTft/2/ge7L8rO/R1BxyFU1RjHW9f2ZIgE4NvCZjtLIb7JnYzJ/0Zjziv6IfxRpaDsO9X9gfy5sZQSZGALemH56N7gqescyPc5FbXzU1QtWBienbvTp1eXcVZZ9n7xr5rwYDSNa1ebW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hNUG+tNI; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hNUG+tNI"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81e9d0cd082so2404047b3a.0
        for <spacemit@lists.linux.dev>; Fri, 23 Jan 2026 20:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769228970; x=1769833770; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O4MFr4awFPQFQ95TEp9Xx5V/NF5VvFij05h0W0v3UZY=;
        b=hNUG+tNIiGFthnHZ7cs+FnMgGyAI4KOdgbqS5/T7PqMvurxP3vDdYdgk+o5Hq3zoQr
         9j6deOgBtFdFDs6EgIHxJs6eqK2http/uPFySCUcQmiTCyI1w73asYBye6cZnUq5rcaZ
         51KwLMYecqecPbC5Efpm08Zj8FZaejO/q/sEghxwFNp9FzDV0dKiC6q+2Sfum9sZEb/1
         7svzpKsJlVUgyC4VFs+/gHm7O5idhPpFq+HkFUit3Ic7ylTOWFec45mPXwQK2rYFLH3E
         Rj04YiFORYZML07bE9SNeKFGSwkJoWZn3BAXkKZv6HTFVzStai+tGDfpZubK5mrAAOxb
         RMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769228970; x=1769833770;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4MFr4awFPQFQ95TEp9Xx5V/NF5VvFij05h0W0v3UZY=;
        b=iDUbqkccJ1sG30hgcl/iQvalojiQH5N7SmisC9xbcanYCqM9eV7nc3VixkPOl4spbu
         2iONmnLYkDSuGk3TZ6zhcqItSkiNK5bFUBgnfULcoCeVtnGhrF9PV3g2AEZvjK9DiLto
         M6yoJ45+ycjado6sJHIK8GmTn++xu7DCPuwEd/xKTBQ74F4eqUsy73A+/TtU4Scj5VnI
         qYFEznH9rC+uBaBRZMCccS5rHmoLg2voRoVNQUhX0XTy3n8AmTVPMra6up9vdj6JLOIp
         eNdXQ1rFDaAUEZQs5WvfUtOi1vez4fid3Wh7m3FL0aA7ei7IsEnH02c41d6+PwefH/bQ
         Emhw==
X-Forwarded-Encrypted: i=1; AJvYcCXp3srtzh9u0DGGFitSw4L5Sxv7i9wEWW8JXz/j3f8mwMi726lI061w7xPxRxGoxi2rq77QLrMg7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFmUMbxp/6JU7BNYVE4GWu7maKA60P7Lsr7pKnYZTPTmHZ7VN1
	bq8CKyx58WWAe1U1Ii79enPArQqh/veGkuuD7V4riYyPgb3IMQHvqNBwXmo+K5XgmW4=
X-Gm-Gg: AZuq6aKVmWgqIHxUNYmqoMkVzJxI/vOstkXvSf93EimTCIuTGSWOm9DmY2V91aJnUEF
	s4sKngS/ToKyza6Gdt84lpPrPEd3f1rrNGOdIPQ0vqfYzbf/Ij7LMMC0RHHSdfJt0HDnHY84aZS
	myUAYFZcB+Y3NnHmigrhLMG2TsoZvBqCIT09xgnEkvGDuA11fFQ65SFjQ7TYznx5dRp9E7q54Lk
	1rmIsVukQAZI3lGBKRJJVGJEYYpDlSp/iKI66hyrAKenVY+QZay/MJvoB5KxXPGOJ0CFOffv1J6
	VSj3+J8ZfzZg6zW7ajAFDJpsnqE6ZOEMFBjLlZC/+vHtrTFXqCp/pT+Jb9Paa20YRMmX8I8xY46
	6haRa0+GD79XZTc+/mYYtTn8Mmeaai4W+mvEGInXrZwOtEtqAdb15JlDPQZE7NQK65sFbl4Fmsj
	mcQZAjzFUOp6D3BEUjRXe5wMshJvDS2f4=
X-Received: by 2002:a05:6a00:428b:b0:823:943:391b with SMTP id d2e1a72fcca58-82317f1a119mr4451736b3a.60.1769228970505;
        Fri, 23 Jan 2026 20:29:30 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231871d51esm3469423b3a.38.2026.01.23.20.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 20:29:30 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Date: Sat, 24 Jan 2026 08:20:15 +0800
Message-Id: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEAQdGkC/22Oyw6DIBBFf8XMujSAhYqr/kfjAnGoLHyUoaaN8
 d9LddvluZl77qxAGAMS1MUKEZdAYRozyFMBrrfjA1noMoPkUnMhJaPZOhxCYrNgFpXR6LGqlIf
 cmCP68N5t9+bgiM9XlqYjhNYSMjcNWVAXSugLGqW06kr43feB0hQ/+zOL2At/dxfBOCu5aVFef
 eu9ucVAjpKN5+yGZtu2L24UNUnZAAAA
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

This series fixes hardware voltage constraints and enables flexible power
tree configurations for the SpacemiT P1 PMIC.

In v2, rebased to Spacemit SoC's k1/dt-for-next and added power tree
definition for K1 Milkv Jupiter.

Patch 1, n_voltages is corrected to match hardware register widths, as the
previous values prevented regulators from reaching higher operational
voltages (e.g., 3.3V on LDOs).

Patch 2-4, hardcoded supply assumptions are replaced with explicit
devicetree properties. PMIC supply connections are board-design decisions.
Moving this to DT allows supporting varied topologies without driver
modifications.

Note: Patch 3 introduces a bisect breakage by transitioning to
pin-specific supply names. Probe failures will occur on existing boards
until Patch 4 updates the corresponding DTS file.

Changes in v2:
- Patch 2: dt-bindings, remove providers from the example dts.
- Patch 4: Added the pmic supply properties for K1 Milkv Jupiter.
           Updated the commit message accordingly.
- Link to v1: https://lore.kernel.org/r/20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (4):
      regulator: spacemit-p1: Fix n_voltages for BUCK and LDO regulators
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

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

