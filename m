Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC971DF261
	for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132773; cv=none; b=ixRgjaU4N/jZrOewFpu1ognap8EG58hyY2BNvUHBH6kpwEQ1ktRlqpkfeoTiHSRNdIT8Abf6BuEe92n0eW3LXrzos8RRwbwW0C94iibE+/NIIWwvwCvJcJgf+Z5Ef6kygSlEh1vBfF7cR4AScg8rEfHKn70tz5fyxVdYyT0bqSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132773; c=relaxed/simple;
	bh=iTRDl9eIM1vHDXRz79uJ7GC6Y8TqkdFZFbsYIQKe0dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZ8qRxmvSLC6tCXFIshKbw2WnIcvk0AOF5h3wSwPFsTFa5xl6PWjE/UHu8wNDf4vTDtZZBj3c8NLGsJjHvNOwFptC+ykNWqfaESCa/cap39K3GZwuHx/NmPb6qIJTk1C3QG6uap86lsxfw5vUU83Cpf/E4HN76KssYFXGwyeT+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Ps/DSThV; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Ps/DSThV"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736b34a71a1so3438619b3a.0
        for <spacemit@lists.linux.dev>; Sun, 20 Apr 2025 00:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132771; x=1745737571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fcZq8o5SROXi3wQjym5oYgJNhmITCc4NsmF81Zj+a8=;
        b=Ps/DSThVgOKXZiwWQD5/XO6t1yV8W0CE06xu4DnVY7I0r2exPIsHpTbcDS5WrNRZDN
         oR6sLLXtzNnHMOGfsLK4sFKrxq7cI/Gaxj194SyMwXgoR8nqM7XSoM+ePv/GTDhSAp4b
         j6wq5vlK1/wwS7NOdcuOg9EFXvqnMSLhLeuwwHIHiVJQjI2zouwtl1jEtRMMeV3yla9J
         WNiw8KD8WRxIMFnkQIWqoPM/65PsX+vwOvEMv6YP4x5/IgPXbLyhIbBHRKruS94FFY++
         UPOllWiB5FuTjOvpaYCxxy2QcwtMOEfUeFXV1sZgJ/4cz01FykT7mGXpp/7wDHfwlqD+
         wqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132771; x=1745737571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fcZq8o5SROXi3wQjym5oYgJNhmITCc4NsmF81Zj+a8=;
        b=bERNclYMDX2BhvTOKCEhraF+hzQgsSaWgmWLIsMMSpb3dYyVL/X3IUqaysMDr4hI/K
         nae2Mf+z0vzu3Y5P6ZjwVUG00b7uLRumDC2tV6+7hsaSMasKOwtV2cSgFDY9MujbuR8P
         Y4JOK2pW7E4c937u327yJCXgknn63+Q0zdHJQSWP/be+8OHQjZElx0kLwqpeDWInI2Uh
         2G+pDuxUyCNiqWTD86qUWEzmpRndS70Pp21BLoEVgAf3SKnhJ6fh+e8YxfAok2JqxjDS
         Nmm7P0Ld0Ye/1WGl0fjYQ57kUo32Nbbx91mi0IeXHy7eeFqkZWuBYa2eeuMmtSDnH61r
         /NMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYJtagd/2+H2YZpXNT02MMR5IKwEci5ZmRkc+84n/ooAI2EfDVxVdcvlNPuOhfGylZ38FvlCCdbw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8Vi6lfYikHjaae0G27XSG36d/F4JSMXj2/XRuLf7mWHFRzp8Z
	n+sCE46MsiJtakUvEnMGaxttkJq75kRT95g6CWsdRmBqSQ0ssSL8dzg46PEg/zQ=
X-Gm-Gg: ASbGncu7XFJ8L1Yl0fMlAAwvWwa642pgH0MqvLBC0yYU2YEW7BwvRqComP0/oXMtiYb
	3/HvT268y60OWkxQZdAbE09nBLdK/4k7aLQWai19BI4wpH1idtpUXsrb47U2ziUdIcdOnk/h16D
	qoZR/FOJpjN9P7ioqB9WBbgkhuw8giu5I65Xv3nNbFLGBPyY/2v7kfptK/jxcvBBuKjZ1ndvnw+
	QBY1ROKGjEPCda+MMHAGukaDbx6DHG1UiZZzsqjCDq2doHmoTj0X3LAPp1gisoPKn47I7HOdH3q
	IBY+Yx1pht11xB/uxPREXV2C5s+V3QXgH/M8Ygt+
X-Google-Smtp-Source: AGHT+IEE+OeQFiCCtU8Ee9YBkXu2dzO/ybh/igItlS4KQN0WO89uCSH/pwRn+/1oKh3T6c5poKcuYg==
X-Received: by 2002:a05:6a00:1305:b0:736:42a8:a742 with SMTP id d2e1a72fcca58-73dc14ccd73mr10174885b3a.11.1745132771298;
        Sun, 20 Apr 2025 00:06:11 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:06:10 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 6/6] riscv: defconfig: Enable PWM support for SpacemiT K1 SoC
Date: Sun, 20 Apr 2025 15:02:51 +0800
Message-ID: <20250420070251.378950-7-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CONFIG_PWM and CONFIG_PWM_PXA in the defconfig
to support the PWM controller used on the SpacemiT K1 SoC.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: Changed PWM_PXA from built-in to a loadable module (=m)

arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 4888529df1d8..8a8b77a0ac5a 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -259,6 +259,8 @@ CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_PM_DEVFREQ=y
 CONFIG_IIO=y
+CONFIG_PWM=y
+CONFIG_PWM_PXA=m
 CONFIG_THEAD_C900_ACLINT_SSWI=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
-- 
2.43.0

