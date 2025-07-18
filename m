Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53446293B7F
	for <spacemit@lists.linux.dev>; Fri, 18 Jul 2025 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752828271; cv=none; b=tBYESpxVk+qsQvoD/M52tK0HKhsNDRbQJjI640wf1OZmmi8OdcxBuBCZlZVj1LFziLCR8uDbOYomLkw85Uu2JkJsG3hADG48wXi62SiaTzZWz80SbKu84X+z7MPoGLKWcbTraZj7Vi/BjMUXcM54bNn+Mwim/9vzPqQHQyLxr9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752828271; c=relaxed/simple;
	bh=KAk0DmLd1Szc+8RqLN4Q1eSR/knVV6oNPm+weoQTnSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wr6OB2kADg6NSalT62qs14+fyTWpEu/3hOD26FfsR/Zfd79JffXzGQsl9R0ILq0fu9E3aaumwjpLutk7pa+P4u0/n7k7Yp3y6527O2qb7jNmYU8NYHjURzNrf+XZo9GEhMneU7049UQvRozCbFH+ej3ngYfIxe86jx3HhbiiAXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=DwnmI5zd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="DwnmI5zd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so1469472f8f.3
        for <spacemit@lists.linux.dev>; Fri, 18 Jul 2025 01:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1752828266; x=1753433066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EQUcoTZuNnVFMQcqVlD/dsEaFXowm3+QSDfAXy+mm2Y=;
        b=DwnmI5zdu4j7IbFkyGJkkq3Su1o7OCuRjtKKo8pWcCI9lGR49gsgThJaN2JCFtYRa/
         oFS0kCXLGtfgTO5KaJhgm4LY6Sa6E4yWXmP02INkW0gwZwwphvX6Qoiqbp7aURjmWq0I
         CBgooSKPzI/eNNaOzwmmhmYpoHMDlRgaOy0Tq0Inop023IVcQhzoqV5Nux4kjm0d4xRW
         L+YPyOfrdI3wZwXJF/83fK4O1mIguGJ7wW5NXa3GK7pNQmyyzwRsQ/cINzb7NktKw789
         rSieoHttJklgmqe4wt/IeJt1S0kaSoSggXdXCUv24nyeTLuE5eEK0lXmUaP/jLbdgfVl
         6n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752828266; x=1753433066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EQUcoTZuNnVFMQcqVlD/dsEaFXowm3+QSDfAXy+mm2Y=;
        b=w1fvK3F30QbgQ3O57e+dQOkrUi8cBO01X/ZsbCPFE6ygYtjCnj6y5aWttq4mwBF21q
         ONDXamfkL68xdvIhCXadHZD/IquFP4IB7Q9w19ZBnQw6qPkx0VPy/f/eJEo6PBA5VitH
         vDUcQQ79oeNDkbnlLIhJfUFTTwdAOAFCPttMyKEGZ2CZadzA2GLSZctjATxlnDDQsvii
         ykznRSLlDP8jPK1BbFbwPnbK/x2jG1v1W38sCJa42B6IaaUiE8BUvTmgP3zaZk0jSU+q
         XOrmy8MKUOIzB3f0SRHmVSepzuDDnLWCgVnfLDKit+45m1nELvloHb4lexZth7s/dXXj
         PuoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+fziiURbkjsE49sUVsyEvlnMAE56FzHMZxNHThAb+ZUGkHJSB5RqVCzb2swZFuLIbhuvr2oNbwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1s5c0RKemKnIktpmPPiVSq7nej4Ot1v0e8GsrGkK2iurYFGgy
	4EACncDd4ytPlF/hdDtFTRViZ7wjc/33+5tnVBYYlkLM3DhVSdWstVFDZYE93eihpiw=
X-Gm-Gg: ASbGncupXkNt9i5KHK5wLOJ3k8mjxi2sJEWCJGg9f2AwDZ75Bhvbc4GsfA5Ke9b1N9H
	GjaeSTPUsRCEL8JraLTfFOCgG1InyV/OXiPP5J1WFtqxq5/bzxIXOnQQF8d7lBhBICSV9qIPlKM
	PjmN7YzZIZw7zaqYK9A/Pz70Cz2/oXGcQUfWAOsy3XX2KkIMflq+lwF72BT1lFKIoKiIONc9eGl
	k2NihCKJCK1zh1xNGuKZavEe53H9Uz3HD2k6tsERplYiqP1rRfWCt9gCSBb+HG/mVjY+mkQ3ay3
	yawaDsqB0vV+V4l8W85NeVU959czAOe8gvnoFhPDDqi1kaURv3u86XfmdUdMQlPYpf+Q0mhjvDO
	Y4q/nVFnKRsQ/Z/yYp0MC2ldVMJubTi3UzW1tair22CYwkd7E
X-Google-Smtp-Source: AGHT+IF1DTxp68FxooAN2QX2xUqfuF3c4Mb9kU6Zx0w2YlTbaB6gQlG+uHFwhWQB3m0w5QaqnggY7g==
X-Received: by 2002:a5d:584c:0:b0:3a4:ef33:e60 with SMTP id ffacd0b85a97d-3b60e51844bmr7888727f8f.40.1752828266224;
        Fri, 18 Jul 2025 01:44:26 -0700 (PDT)
Received: from pop-os.telenet.be ([2a02:1807:2a00:3400:9aa9:dd5c:bad6:e31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45627962384sm58208115e9.2.2025.07.18.01.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 01:44:25 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: Add initial support for OrangePi RV2
Date: Fri, 18 Jul 2025 10:43:37 +0200
Message-ID: <20250718084339.471449-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds initial device tree support for the OrangePi RV2 board.

The OrangePi RV2 [1] is marketed as using the Ky X1 SoC.
However, after research and testing, it is in fact identical to the 
SpacemiT K1 [2]. This is supported by the following:

- Similar integration in the Banana Pi kernel tree [3], which uses the 
  OrangePi RV2 and identifies it as the SpacemiT K1.
- Comparison of the device tree code showing a match to the OrangePi RV2 
  Linux tree [4].
- Locally tested the OrangePi RV2 with the SpacemiT K1 device tree, 
  confirming it boots and operates correctly.

Patch #1 documents the compatible string for the OrangePi RV2, and 
patch #2 adds its minimal device tree. This enables booting to a serial
console with UART output and blinking a LED, similar to other K1-based 
boards such as the Banana Pi BPI-F3 or the Milk-V Jupiter.

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]

Changes in v2:
Patch 1: no changes.
Patch 2:
- Added aliases section to the device tree.
- Removed the memory section, as it is populated by the bootloader.
- Updated copyright header.

Here is version 1 of this series:
  https://lore.kernel.org/spacemit/20250711183245.256683-1-hendrik.hamerlinck@hammernet.be/
This series is intended for the v6.18 merge window.
I'll follow up after the v6.17-rc1 is released as suggested.

Hendrik Hamerlinck (2):
  dt-bindings: riscv: spacemit: Add OrangePi RV2 board
  riscv: dts: spacemit: Add OrangePi RV2 board device tree

 .../devicetree/bindings/riscv/spacemit.yaml   |  1 +
 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 40 +++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

-- 
2.43.0

