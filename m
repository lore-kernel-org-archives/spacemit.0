Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FB1480952
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769067022; cv=none; b=tl4fQDS8i+uf4r9lFRz9Sp6AdixS7cJZ3Pe4+01jDOJg/pQDZyXiQjB/LDDEfKbm7XwMzzhn4QZ+DGL77jLjrR8GUHF7fO/zGMppp1ZEZYUeKB6R8w4TPsRK6XY31GzvztWfwtuRKYeqcV2Orn+EF7hWUEF7sCbiU30YDkVu/NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769067022; c=relaxed/simple;
	bh=//BOLOVEfaty+6g7ise3XsMFATmAfMCf0V2RukYrm9w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qbvl/UwqENgw6OrMEGRSzbas80t99Sj6KZVGTPiK3dehOaj2l3UqLrS7dQJJGuC+40bi74llnluV0qHLwpIWOrhubJ2ooIDeUS5soxoateJy6mEXRNQpXL9gPL66byArwnqRHpKpqw6sKjVuSXkOnd1Aa5U9BqocZpbayZy+UAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Vy/wzTL4; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Vy/wzTL4"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a0a95200e8so4796395ad.0
        for <spacemit@lists.linux.dev>; Wed, 21 Jan 2026 23:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769067015; x=1769671815; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rr//05gnIsnuXVsjz8imH47FYtOzf0eSZEjsWbe6eJ4=;
        b=Vy/wzTL4Eqh7XlUP8q7/DtBX/40MAE9+iuMNQHxIyIUz/vk16u4+Se1CIP3varNGgD
         npRwk3EApT1haIMSaNWtEWvkPOHwMvWNCsRo5dNzjGHWErtJQS0tbHGe8lAuKoGBMAp9
         p0EfMjJKYa279R8KpBLjhCpVHpPNNjpKJo/jvde54ZQsq9UcrAbCXlLQxjG1Eeo+cbaa
         OJvSFktX06wZcOIbEPSEbOLBheSHKKLE0CERLHlAILGleYtZvgd4xQqZa6NCB7cw3jat
         oDDQsw5kPadY+HF7nCa1+ZE7uZcLYb5wx5HNRXe6MDISaWhVrUViBt38iefqnCUiYmnJ
         54aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067015; x=1769671815;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr//05gnIsnuXVsjz8imH47FYtOzf0eSZEjsWbe6eJ4=;
        b=tOJnpojaG6KO1iNrvDpplCMTz2bEWFhmkdx4NSCEGe35NAYyhH+PYHKkd9Vi6AqUia
         qh4Gx1SHCSqnsSRVK8hUhUup22gy0tKKz3ts575psv98JbhAKgCGFEok0TRxL4ZSWFY3
         QuCoAD1oA/lnueuIQyoHRHqa79W7hgpeAsxD592ln77sBRvd9TsjAMQNJgGt/o38+9Ds
         aGFTGpuS+zOD2eMwl15UUIbw2htSgKK+avJh7vP58+QMKaIF9ChLo5IyWxldxioH1Nt8
         gMnXLBEc6sqQqtLHQQUoyvXAyrjSMtMa/LP+ZeDY4xQLLlgfRE3MT+dvYXNIPlcomZsV
         xJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHrRDKubJ1Clwid6vi252AcNA9AOeC1I3KBgbRsGQ/qqyjSgb6YMIDOmMTip/BWhrNO6aCs4Cm6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVBEkvoHActxqP7b8g+TCI4w8J1qH2BnVjMh1gvyMIYZx3/FVI
	TfHLrIiqaPHTDKCtrXvpbZqUF52+C4n/fZuuPdUF1tQHCy4KkC1o82ET+7scTN2sh192soc3WBp
	FghBk
X-Gm-Gg: AZuq6aLEyJTBhxZyU1SYMcTCPUhbx9kNAUYYPtay4+aP5+q6PBkIYz7w7vAm4flym1C
	dVWIKJ/Azu+DP05vcyjC9HRnaHeNzkr2ZCsGPzxsdxQ3QLMGJI7UN+sAr2g0QuuU5RUsXaNudfi
	OMOUFCI9Kg7dNH0EgZ12LXo4jvBAWt7Mn9TtuUd5nMjawu4wRbq8TYC2NDhyKlX0w6mq7q1i/2Z
	LKJfqdEToIFtnKZ5oj0QjY1662BgnUyxnH81S8xwquqWeWJueqvP7tgjTp4vvhn017GXIKXZPGj
	h0AoFYfcZO+KqdU8QoQdQ8/HgI+ZM4c9ZGpTx3LqNRQ7FeSKwro4r00+65lfA9HtEakjytnsNWz
	0jTqUvMBZ3SozDMMZaxZeLz7ILsmNcP7+OIqlP97eNeRoHyn7fA5vKLQglJ5pBttXaOWdNdLmVy
	ybZUbdfhZ4WeIgRuEZv7A3j/3k5emZUno=
X-Received: by 2002:a17:902:e84b:b0:2a0:d4e3:7181 with SMTP id d9443c01a7336-2a76b1693d2mr79306355ad.49.1769067014961;
        Wed, 21 Jan 2026 23:30:14 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::30fc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9edesm171691845ad.23.2026.01.21.23.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 23:30:14 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and support
 board power tree
Date: Thu, 22 Jan 2026 17:43:41 +0800
Message-Id: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE3xcWkC/yXMwQqDMBCE4VcJe+4WEzCor1I8pOmk3YOabqwUx
 HdvqMd/YL6dClRQaDA7KTYpssw17MVQfIX5CZZHbXKN8411jksOEZOsnC0HtL1HQte1ieojK5J
 8/9ptPFvx/lR0PUe6hwKOy1SBwWz+anvW6Gk8jh8j8q9vigAAAA==
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

This series fixes hardware voltage constraints and enables flexible power
tree configurations for the SpacemiT P1 PMIC.

Patch 1, n_voltages is corrected to match hardware register widths, as the
previous values prevented regulators from reaching higher operational
voltages (e.g., 3.3V on LDOs).

Patch 2-4, hardcoded supply assumptions are replaced with explicit
devicetree properties. PMIC supply connections are board-design decisions.
Moving this to DT allows supporting varied topologies without driver
modifications.

Note: Patch 3 introduces a bisect breakage by transitioning to
pin-specific supply names. Probe failures will occur on existing board
(K1 Bananapi F3) until Patch 4 updates the corresponding DTS file.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (4):
      regulator: spacemit-p1: Fix n_voltages for BUCK and LDO regulators
      dt-bindings: mfd: spacemit,p1: Add individual regulator supply properties
      regulator: spacemit-p1: Update supply names
      riscv: dts: spacemit: k1-bananapi-f3: Update PMIC supply properties

 .../devicetree/bindings/mfd/spacemit,p1.yaml       | 58 +++++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 12 ++++-
 drivers/regulator/spacemit-p1.c                    | 25 ++++++----
 3 files changed, 80 insertions(+), 15 deletions(-)
---
base-commit: c8a4a774a9b0d2c86593492625874e27e9cbc9a9
change-id: 20260122-spacemit-p1-ae596efe885f

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>

