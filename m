Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324B634B40A
	for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 15:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070763; cv=none; b=hjSYOt+TksLhD35XPjHCavTI6LfsPGSvrLd4+MSiqFA+DXwaNU2Z+zoy3yMTJF9qlP2uKOTeU6wF9AK79vKTWmyqUr0NEj6/Qf681PoiexmPUniJTCee9EA26cYOaxzKChFrXaOuQh3Em5k2iNqH7S3lA4fhHZBNYY+/02l0TrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070763; c=relaxed/simple;
	bh=lxVvGBsXGYN3n2uwLz0zt9lASjy8gictqN1aufF7Lq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gAZ/bNpASAlLLgB/5yMoQ4cv2P2LP/5uTpxs549i2XlcxkxR+IePdSdfuCprCsT8K/o0m9REizS1Dpv4nFdCxMsPzzy132poVmRPIx3c+EJBAv2z5oXw0pNSrfvE1LXkjW4fXoeR8UebAtG7qhox3/FI21V50eX/C7OkZbF1iFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ubSovVXo; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ubSovVXo"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8bb6a27d407so68965885a.0
        for <spacemit@lists.linux.dev>; Thu, 18 Dec 2025 07:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766070760; x=1766675560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4hIaGiL80zj7kXcIMdv66SIiq2tbAwa49JkVUuORHZU=;
        b=ubSovVXoEujUEJ8d7ghfkcGEhNHwIsdAeYqbOD8XLDyb9bcwCrb+WJkMd97faoJCgb
         nqxgLm8qtu70gvOm+pCwGF4LuxJCFuvUIbENUkkAIYs9WTP4BUMNxSktu855gBUqwvRc
         gzONfxQR4AMiBP5Y881XPkYvZ9Bl4/iMSBnQLnrx5NY3I5tlUIkMQPCbRYhJQTUGRYru
         viq+2jbW4S1AixJfueEqhLtX5aFU0/YuZRUmf1tM/ivgpJXMUVV9bLopuuIYG8JiktPe
         QMdO3IAHZs2Y4rHW+V8ql1gZcY5QFXZmYCIYRwNGajAt3m3AI6qdH996oRDf9hbIjaiH
         0eNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070760; x=1766675560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hIaGiL80zj7kXcIMdv66SIiq2tbAwa49JkVUuORHZU=;
        b=HLNyTbmRJZLP7kVEnzLN00zPWcEISh6hQz2WByJfHPv9pxUCBXCC9UhphXwVju0/eY
         juNUJY1Y4LANAaKedVXgvZoT9s+dpgCGB5vajxYccaTH4NYtbcKHaqy3n0MBlVRxTFX6
         0XDqWmSRrNKihVghKk9kALROuLdqzSs7mVnmFwDXAP0rkTZdW+jxHaJjssdJU/zivyWM
         O7+O3j0EfMAVdSZtCKSOs9/cO9EGgJQ5hhgcrD9SKMEXLHXcIU5CoPnp7N4/HvHXssFx
         wJog3GN9Y3gxqUOCinQFSdzaiwB5UuHL4QUSGqRieoQDJG4/Hci8G3P3R/Gx3G23anxf
         /OwA==
X-Forwarded-Encrypted: i=1; AJvYcCU+n1f6aUjfEwsucycI1kjVD3wxRZXXngau1VItfdIC5r/u4KqMzWKnaxjLxbjkmQnNv5oKov8w0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGAr0Xh3gku6xlkr4WRNz7mVEGTtYGeBRUZEt81inb92H5cdfw
	UlE26l9Kbe2rzCwOvly6dIXeG+sKMvyN+YXm15E9FjKGcQ0fEYNjewTG+mNKtUWJg9Y=
X-Gm-Gg: AY/fxX6Vb5fDkEnYSXq9RjXUXYdEzght1z6q3D0POVUNZ7XI8gti+sJm2sVLv/mokE2
	jI7p+qKP2co3/nEseykq4iCr+HnjtrKiIClhPUaE91Cu6x2rWiRpWqLGC8ZrbZfdYixMq4RIvSB
	PQuc96Wv0cR/cKWTtNBnZJvWGV2oEWxyGspm3acSbsbJI5cYlnhFiaHMkyMbKngSsGPmzZ0zzR4
	wWgjBnyeMRKn+ocmN9B4v3YoThtuz5bqO2e2dQ3oBD2xuHr79k+wPf1Co4ju7e9KC5Okb9aH+K8
	T8n/pRy70fBEuknLCiqLYZOKTCvhEGWl5JLk6rssBmyGKCWvP6pNBjFgQZYwlEg/FpKPo3Tbyub
	xb98GVfhxEV1e0BMFmpjMlFy2VfGp5V5EiTB1qeS8FQIGV9GkC9SSRIkKoj7R/zdftoDqbMjYHH
	y+roJabLtoOJBJir6tZe0gVdndzhzVWtfYF+7z8FY6cI6hI/Llna4FDg==
X-Google-Smtp-Source: AGHT+IHmVmM+H9+67oq6BOeGEFhlTWftMxnr3gXZbeufLi7tT0T4NovnVfrEP3C8OYAsipwfxkDfaw==
X-Received: by 2002:a05:620a:1a26:b0:8ba:5255:107 with SMTP id af79cd13be357-8bb397db52bmr3259102085a.18.1766070760006;
        Thu, 18 Dec 2025 07:12:40 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeb5d6952sm186866985a.3.2025.12.18.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:12:39 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: ziyao@disroot.org,
	aurelien@aurel32.net,
	johannes@erdfelt.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/5] Introduce SpacemiT K1 PCIe phy support
Date: Thu, 18 Dec 2025 09:12:26 -0600
Message-ID: <20251218151235.454997-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces a PHY driver to support PCIe on the SpacemiT K1
SoC.  The PCIe controller implementation is derived from a Synopsys
DesignWare PCIe IP.  The PHY driver supports one combination PCIe/USB
PHY as well as two PCIe-only PHYs.  The combo PHY port uses one PCIe
lane, and the other two ports each have two lanes.  All PCIe ports
operate at 5 GT/second.

The PCIe PHYs must be configured using a value that can only be
determined using the combo PHY, operating in PCIe mode.  To allow
that PHY to be used for USB, the needed calibration step is performed
by the PHY driver automatically at probe time.  Once this step is done,
the PHY can be used for either PCIe or USB.

The PCIe controller driver that was included in earlier versions of
this series has already been accepted upstream:
  a812b09a6b599 ("dt-bindings: pci: spacemit: Introduce PCIe host
		  controller")
  ff64e078e45fa ("PCI: spacemit: Add SpacemiT PCIe host driver")
However this series still includes devicetree patches to enable the
PCIe controller (along with the PHYs).

The patches that remain in version 7 of this series are unchanged;
they are simply rebased on top of Linux v6.19-rc1.  The first two
patches are the DT bindings for the PCIe and combo PCIe/USB PHY.
The third is the PHY driver, and the last two are devicetree updates
to enable the PCIe controller and PHYs.

					-Alex

Alex Elder (5):
  dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
  dt-bindings: phy: spacemit: Introduce PCIe PHY
  phy: spacemit: Introduce PCIe/combo PHY
  riscv: dts: spacemit: Add a PCIe regulator
  riscv: dts: spacemit: PCIe and PHY-related updates

 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 +++
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    |  71 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  44 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 176 +++++
 drivers/phy/Kconfig                           |  11 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-spacemit-k1-pcie.c            | 670 ++++++++++++++++++
 8 files changed, 1120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
 create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.48.1

