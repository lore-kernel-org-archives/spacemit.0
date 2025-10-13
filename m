Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DACD313548
	for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369745; cv=none; b=BQloFoAROXoUampQmw8E6RdpbY6N78IQ49O2PsnX1uirekJYGoej1oeabEQ6glV1BtTX/QUsj5nPERWVXy/t0L8WCRfBW67AZaTjI5XH6sM22/Hmje7I4mOYCtQJDiepUVuzlwXijOv8fey91jjFSCG7rV7HU7QR3dtSPNAwx3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369745; c=relaxed/simple;
	bh=WJWs+NFUcGbJALoN3wXML39lAbVPkKGzBxDYg5OA8Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uWTPmHZq1wr7ZiIsiXbh9Ssvm6SCODn2+qoF+IdDTJFPDzqCU8NkTVpNO9U98POsxzHGLShr3NnUrbFIwKs0ko7re4ILB0ZrnGtKllN27S0g4Tn1VTj+26GlHitC9leMcGBiKFeeHCvSIQi9+biz2u4NAgidoCA9EnwrqdJ43qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=jdU2HCZR; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="jdU2HCZR"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-42e6df6fe53so18150175ab.2
        for <spacemit@lists.linux.dev>; Mon, 13 Oct 2025 08:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760369743; x=1760974543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbPxvqkXmDdFxjU8mZBTBK/T+YiYjBFrlI/xnqdkqi8=;
        b=jdU2HCZR0HSs2xmASjsX+hjkIPgTnSdpuSHivsG5cx5fI4R0dUpGsGijCcBBlJupy/
         LASeQ+DDwfbamztvppyC1aIBJ+ajlsi6Brw+t0VHt3+oHyax1dOtwMyo9ncouE1FlsUF
         2kEEBfBZl13TheY/dj1LIEjhVh7m5Lj2YBsnBj16tPqZg/VYiCoL7OJNENbUsR91pbRW
         qEliDDfHigleS6fheYKU67ietN1xF2YaWjfikQplVng0MveBRnX6rsgm3C7DznXAiRH3
         Tvv/9CHc0f/h0wivjMw7Sj9ToY7wlIyVDN71G5FfWqDrMquxgmC42qd4a2Yde5wNu+16
         EKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369743; x=1760974543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbPxvqkXmDdFxjU8mZBTBK/T+YiYjBFrlI/xnqdkqi8=;
        b=Quo7jno8cHwSebDq5JoBCM1g2eS6/nGLksoB/7S55RdBELYbXj+Cs8OumAS02Hj3h9
         fesnX6dmk0daIzxgJZ2tsvJS+HL5UKJo5IU7nKzXwd68OdGtG8oG8pFg8Ti6qB2+Ryua
         KxnNwXPXbK1Y6HmbcgRg6yuvRXqUXj5G+xSXnTikm3coL/o/CA68MrIzESgQckNOQQQJ
         JEHM2e7h1kpB9lxD7n3KV1Te9CosmwsyV9RWWlJq6ym/isTtOihhPvTK/GzRiEtgFFnZ
         3FynSMXwqiPsBbUpprWcfnsvqEUQn11j19veNNQ939uraaXZaFCp/iSYSGN27tQ1yoOg
         ZPRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTEb7hQS0nDAuE+m13tTJo8yoHP3jIWw5m8b3F6vsLh/jyqHq33Z32XkQLj2jA3d/3mudc7ej7VA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyps7lQ1QbMuEplERsK1/grhHkUoWjYrYEELdcCkC3y9e5eeNes
	wOgBxBBp8mWHCBIMChh/1yHKR1JBo46OKVG3SfWX767n7I3HlVR6OsrScPexMOXe7yM=
X-Gm-Gg: ASbGncvUMnfIZEUJpRPpKDBedzQyJRZCN3F4lsNhvxsPPKv1UkubwjpI5RTcl0mOT06
	Tjz2Frsok4l3LlD1zyvQKH16SAyXRaRwBCBajEdukniJ3lB52arigCjMK6FoJQrXpUGDElb1ETw
	vMhzJ1TWO6mRdp/POkDP8eGdXWVAF9zO3/n5tnsqUQNrNP0sWTxhXRZQSbf+otR/Oe71e96U/qR
	iOnQLsmIxG3Wgu+ZJ8gcguAREnOpbtoo19xERtGRa3WgYM2rJBjDHPxw16ed2aW9wHzsOLgK99m
	ybFphP5yDIKBRT1DOJDQNSdhRVt1WQNFasFZkpqOjVeYGomt3dVLdmqKrR1ON0fzxAuxOwRFCuN
	iMJZ7VHDfxvYFY1b7xnZ7kov5xwBCuVFTgix6sLUb+F5f2Z7jJXqWHACC+K+5ItElp0Sy6zQ09O
	IAaSlPoUq+
X-Google-Smtp-Source: AGHT+IE+RgkOmKUAmZ+h2lR6Ri91hcZZDy7nYDDMDTZK5PVvcsi3GRbcTYzKlh5jsPOXdbbG42NjVw==
X-Received: by 2002:a05:6e02:4918:b0:430:9bc3:e1d3 with SMTP id e9e14a558f8ab-4309bc3e4b3mr13658895ab.12.1760369743033;
        Mon, 13 Oct 2025 08:35:43 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f6c49b522sm3910266173.1.2025.10.13.08.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:35:42 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	christian.bruel@foss.st.com,
	shradha.t@samsung.com,
	krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com,
	namcao@linutronix.de,
	thippeswamy.havalige@amd.com,
	inochiama@gmail.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] riscv: dts: spacemit: add a PCIe regulator
Date: Mon, 13 Oct 2025 10:35:23 -0500
Message-ID: <20251013153526.2276556-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013153526.2276556-1-elder@riscstar.com>
References: <20251013153526.2276556-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a 3.3v fixed voltage regulator to be used by PCIe on the
Banana Pi BPI-F3.  On this platform, this regulator is always on.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - New patch, for a newly-added regulator

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2aaaff77831e1..046ad441b7b4e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -30,6 +30,14 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	pcie_vcc_3v3: pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &emmc {
-- 
2.48.1

