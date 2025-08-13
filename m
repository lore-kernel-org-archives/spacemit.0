Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC71CEAA3
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 18:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755110829; cv=none; b=CzbyAg/ONmYNwcjnvoSCjqRQDndEXTr2uBhYKtEDpBfxqiWo67IOLIF0xabm2Q8r86GXOcVaIg4PFXD0NxsVUkzp6rdAiihXzer/KZInOhAw76FJpRyWGPTN6FSLYKO9dNsXg7PrvojnpiTDwy5WrxnWOqix42ftXHpP1EnSELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755110829; c=relaxed/simple;
	bh=rRD7cCEqQsfqIWRQE+8gNwUvzHsQOHHZ6SWAdO9fsqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HKwjqBc8NIvOoWxJgl7e71yB+nSeBO/LsCDcqziE6BUxXSicASeBG4Yz9WrOekKUizkgEhKECLqfsSB7K6NT6vl5Z7rdXxM+WOqKT1akuiOf7gvnv4NAioPa+AhSzh5zu6DEONTdxXegbxely0boKrWLgNcnPcAju8gW0VtFNJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=J6FiPeRO; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="J6FiPeRO"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3e56ff0fa61so1696405ab.0
        for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755110827; x=1755715627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KXgtHtogm5A4R/WnbeHN7aFUW9InK5mQEbz2x1R9n64=;
        b=J6FiPeROhkXaWBfjhETQ46AM0E2vGPSj+HRZ2ulNvRv6USQlzUz5aDxLPkcSm5xc2T
         qWvIhtNl/ycDD83fGjIzEQfdCpZXE5KskRbI2nohRd/Cu2GOf8bzGMZizOAMky3kGKIL
         Dqr4V4jWNR5slaYX6Cs3f8Fqn4maiHatTkzAT+T5cOEXxPWz+zYoDjVwfNx3hvG3372e
         1Ltqu4vLZURm5j7QSX3asMd+wJz040j5D+U+RBiLYcxiUrSofROGrDjFCBAcAVS5JR9C
         GsjwpO7hLhkzPOhhU3qQtoHBQqO6fFTb0pkmiH5db8rntDS98Ns+uCfJoYglfLG1OZXx
         d4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755110827; x=1755715627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXgtHtogm5A4R/WnbeHN7aFUW9InK5mQEbz2x1R9n64=;
        b=mpeMASTFx1WBTwygvT+aZ1ud8ViJ8dVD6Xm/JUNghwJ1IkU/TFH6LO9e70vH8bbIR5
         JgONAt8HTDRfMHfnxlChNxXfqhMLSaZANHpVRzQHYlmczR0ijIe9ASdA+r2uDFG3Cg3R
         aH0alaI2b5XL+BzcLOZlYTz2XkiDmxHUBq9OuWai4d7fj+jbEg01fI0XHY/wa0TYHu/O
         5GXeRDvWUjONWQBUK5ZP8IzRBOtZ/3/IMAburA/oqf7O8yce8rlebm0vjeq9Kh6umZX4
         hUcXyuARbRchYpK6t/NbVDuYWDR56jQ+LzRJZxN+U1weLxxp7MuBiMm9MCSsoF9tyDQk
         YJVw==
X-Forwarded-Encrypted: i=1; AJvYcCXpSfyYdqmmcAuwFF7Xx0JfcOKzaJmIsVwV9cMYmw+n+EkvIYT55VWlK31upgkGcQmKoGVVazr1WA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKhSMDtolzOT9Mea/+0mJir9c0sJCzOS9cMoKBvr9Hkz0FBrSs
	K71chmA+R0DztBOO8DNWy1aI//47vjHcuhuM1cTOaAP0oGEUbWKGJIT8eXGRBuCAn6M=
X-Gm-Gg: ASbGncv7MHcS9Z7NpdgB+AU7zB1HA0AMUMlve7V+phQoitiZVcIoRqGxNyFPgYWWD8G
	/wfNOVJBCtMETH2ylz9dpeldtfkhceGdZdkkWDDjJm5edQu8Y+US1O7P4xHIqYeby9cZ+C2zC6i
	2jTGGZN7owUgJgu4QY00xwfTVR5XuDaRYjFTKtNn2QZgL4n5Mc/OTvPaJ7u5oVdDCpZf/CRMv3O
	DwVqlvuMnlrGNXpz/ryIVw3luU30C5NeVV5OrXBO/zrIRk0lgJTpHQ1Cdi0+QCRuDxUefPIYF2e
	pld+sQTiQXCH7vSD4S3uBFlr4qKvaJwBX8XLSjUF88ypm73kszoj4Sxf22tmS/KW9XiuRYBfu25
	DCEl4ks6lmvesAwXC2k5W/GjoUK1u6USFDJxe/jXskFxFazdMba9h4QFWC2D3FfJJ8Q==
X-Google-Smtp-Source: AGHT+IE4C3i9M8kXUz9O4UxOKjpcYn8lEZvQJ6gg/sXkMzZkGV6K8yFbp3z2/m0TNzRFI95fCD98Hg==
X-Received: by 2002:a92:cd8f:0:b0:3e5:4002:e822 with SMTP id e9e14a558f8ab-3e57091642dmr4986915ab.12.1755110826731;
        Wed, 13 Aug 2025 11:47:06 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bd89d7sm3933104173.59.2025.08.13.11.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:47:06 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	tglx@linutronix.de,
	johan+linaro@kernel.org,
	thippeswamy.havalige@amd.com,
	namcao@linutronix.de,
	mayank.rana@oss.qualcomm.com,
	shradha.t@samsung.com,
	inochiama@gmail.com,
	quic_schintav@quicinc.com,
	fan.ni@samsung.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Introduce SpacemiT K1 PCIe phy and host controller
Date: Wed, 13 Aug 2025 13:46:54 -0500
Message-ID: <20250813184701.2444372-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces a PHY driver and a PCIe driver to support PCIe
on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
one PCIe lane, and the other two ports each have two lanes.  All PCIe
ports operate at 5 GT/second.

The PCIe PHYs must be configured using a value that can only be
determined using the combo PHY, operating in PCIe mode.  To allow
that PHY to be used for USB, the calibration step is performed by
the PHY driver automatically at probe time.  Once this step is done,
the PHY can be used for either PCIe or USB.

					-Alex

Alex Elder (6):
  dt-bindings: phy: spacemit: add SpacemiT PCIe/combo PHY
  dt-bindings: phy: spacemit: introduce PCIe PHY
  dt-bindings: phy: spacemit: introduce PCIe root complex
  phy: spacemit: introduce PCIe/combo PHY
  PCI: spacemit: introduce SpacemiT PCIe host driver
  riscv: dts: spacemit: PCIe and PHY-related updates

 .../bindings/pci/spacemit,k1-pcie-rc.yaml     | 141 ++++
 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 110 +++
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    |  49 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  28 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 169 +++++
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-k1.c          | 355 ++++++++++
 drivers/phy/Kconfig                           |  11 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-spacemit-k1-pcie.c            | 639 ++++++++++++++++++
 12 files changed, 1547 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-rc.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-k1.c
 create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.48.1

