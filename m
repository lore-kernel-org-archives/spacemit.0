Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9686E1A3160
	for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 21:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848520; cv=none; b=NOryTnX7Y9+LkGOp1SBMxtIURxZnask1kzNwCsuH+vfmlBloOdv3nHj4gcS2gYJtLYQtP2ip5PCyCM/vYHnnLDr7wHg5GA0SbV+clYKZwiBWi80Y1zTapTmbAA55hGSK4M6QZHN7CEbdqU+zhVppZmtcnsZUCZkPRjp9MhuPcY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848520; c=relaxed/simple;
	bh=FnVVHXaWxWT/DQEvbDfL88dBI7zNVZb9QTeYiBMUa8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rr9dRvpMhgFUuiLXuvy3smLkVSxkQsdCZgEInBK4huKAzIkl53RW3L1jFWFpWsALOSa5/YHXWZ/Fnj6T8DUekVSwR7hVmUdYRtG/uD1knHQm3DSL4sGqpeM1Ups2gsn/H967Bkna6ZykgvaqdLNmDhqZaHEbV6D8K/2eMxiTSOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=N8uvM2L6; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="N8uvM2L6"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ddc9872e69so9486905ab.1
        for <spacemit@lists.linux.dev>; Fri, 13 Jun 2025 14:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848515; x=1750453315; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/nSScsiqRBJeianI+qHcrQDt2tXUry1jim/akdgTKzo=;
        b=N8uvM2L677bXkUmcgvS1A4hVWbhv32wzzu2n4q72EPX4ZvpAzOZei1BOciXAj1YvZ+
         2D1mUZ6nE8fFD9P4UXUvs9i6EYsNyU6zhC/pM5iEa4jxkx4+omrolRwtFHbh/XcuKTbo
         jcQ5nZuSZMAMKsHPB8G2trHdt0csNghAyrld7s/sIAszs3L2wLQqaBxs+qnOMT+s3WJ3
         f/aNlumTSIcEAoo6qArClhLckPXfeggYrhlDZc2GG2aPIAtllp+XjuFTevJeM5Xdmv3h
         m+AEiWxbSz4z+WRFefJuA5/L2hXE2cRgPcuPiKsi4CpRpgrfUM4wwZdgCdqUkisjc7Fk
         PV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848515; x=1750453315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/nSScsiqRBJeianI+qHcrQDt2tXUry1jim/akdgTKzo=;
        b=FXgiB3Kn2GcwLdNl8SDvjwAWKBT3lt3XtyxY8hWiWRyA22oCwQs99p7z6QzGaEx5du
         XbJAiY81aJtD3TYD+Sb6uq+ZIbTWHUbS6FcFuCgGRLKvDGTvbU3DB9w2E0h/KngM1sPi
         Gb0yk9vxfJxIX1xJzOEUVRSPRgFu3JrBZMmJylw7ZijzkWulH3LUGt6HlsAxKHeYpvDQ
         iBN/7KmNubAWpekj5ei8qxcXWLV9P9zjWf8LFSaupRhTFoRu1zFvFYUXjJvBKAbk4eS5
         Fk34omxITdfXnlh6uNeIo1FF18+U5XoIcWC//DdQjhY+cJpZq6fclUEQ1KkjxbHnqnws
         GyZA==
X-Forwarded-Encrypted: i=1; AJvYcCWVYlP17Dwx7XY8Zgq+NDEKCyzt4r/zrJT+2nWcUeTXsXGMVo/AXgcWVRdrRqnn0kjd8US0ls6Qvg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl3MFjxvjoCrMqzOtNfsd/ZC5HtjqUuIrBb6jvQ/TJzKdCn4E1
	pr4q4HGFqey0UsOGwT7uw0w5k2ID3cE+UKZ7XVu3L0jssn4MdeAd60TbWkCdrIHAkto=
X-Gm-Gg: ASbGncvSaQ+Mz9NJtrnSUpZqkWqMWaP4BfqFv3b4+5B+a8YEZIzQuI/NkxX4RAw9Q6m
	9XlsSt79mIvZgiIPkqozu7IDUVbuDlSFQrjE/JlYw4h/b6zeFfft75kW5C7e4LvPBYx+o78BwDD
	bTeevc8x/90C5tqdMF7HL0lPiYLI0SB+2NZ6NSaYjPXZ4iqDjalQucRO1DuPF3AHhCPfVIrdunX
	+7y2Cvui94sOxsIVe+p0tyZToZDQiUT6ghjniTKsL+VisR5x7q2WgeaNWEfDNYyFHulyXUvd674
	EohqOd6lMFfc7ioSI37+Ed/HoMbh01vXuJQzE6YisDwmWBuT4/inhkXnPPp7AEx5VrpEMPRKwVx
	8napS9yEscHGkcAC+00xYib0wRNifqXY=
X-Google-Smtp-Source: AGHT+IHDcIli2szJaJCMzYiSgz3vKDNO6J57pPYGeBj4TOdFPi4bGMhE8W4WUaTIJisML0Aw8vxewg==
X-Received: by 2002:a05:6e02:1a81:b0:3dc:7f3b:acb1 with SMTP id e9e14a558f8ab-3de07cc207bmr13106355ab.13.1749848514714;
        Fri, 13 Jun 2025 14:01:54 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:01:54 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] spacemit: introduce P1 PMIC and regulator support
Date: Fri, 13 Jun 2025 16:01:43 -0500
Message-ID: <20250613210150.1468845-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT P1 is an I2C-controlled PMIC that implements six buck
converters and twelve LDOs.  It contains a load switch, ADC channels,
GPIOs, a real-time clock, and a watchdog timer.

This series introduces a multifunction driver for the P1 PMIC as well
as a driver for its regulators.

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pmic-v1

					-Alex

Alex Elder (6):
  dt-bindings: mfd: add support the SpacmiT P1 PMIC
  mfd: spacemit: add support for SpacemiT PMICs
  regulator: spacemit: support SpacemiT P1 regulators
  riscv: dts: spacemit: enable the i2c8 adapter
  riscv: dts: spacemit: define fixed regulators
  riscv: dts: spacemit: define regulator constraints

 .../devicetree/bindings/mfd/spacemit,p1.yaml  |  86 ++++++++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 138 ++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |   7 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  11 ++
 drivers/mfd/Kconfig                           |  11 ++
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/spacemit-pmic.c                   |  91 +++++++++++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/spacemit-p1.c               | 154 ++++++++++++++++++
 10 files changed, 509 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
 create mode 100644 drivers/mfd/spacemit-pmic.c
 create mode 100644 drivers/regulator/spacemit-p1.c


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2

