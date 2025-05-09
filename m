Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0511A28FA98
	for <spacemit@lists.linux.dev>; Fri,  9 May 2025 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789659; cv=none; b=ifh+8RiKm6DVoMzmihpwhgDRwhhavUUlaxUk9Ta+LCvi1Y7afd8EOGH/L2PEAYqGGGYI/esQkMGs7TogX1s85VGRYQrMHh1tsvtNXjRxqHLZslBSs3o8fkOGFTxH9QRhBTmTVzLBAzbaSd/eZUWN7PeXWbrq2zResBZIo7yDSIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789659; c=relaxed/simple;
	bh=o+DTlUShzMqTWdpVptHXPZF7T6Hpe95l3FZm/2enEAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hSpxNW1VbguMd8c2URSxyKcZJR8rizZ4FT9XQksPdhvs3EUFQz6MNeCPXq9pnjZGvRkRWoMEVRhRGAtViZsHXVob22bnvNkSLEHBRrLZswyYZbU74jPFd3AnZxMCBGF9L8sZg1s++Te0zJpIcL3DtCfu3c3fZ1EoYp+ahYWQ1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=UEy4Md2s; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="UEy4Md2s"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3f6a92f234dso1589649b6e.3
        for <spacemit@lists.linux.dev>; Fri, 09 May 2025 04:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746789657; x=1747394457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=UEy4Md2s0ojXPS1iUt8X4FQSWpf1FwlDKrbcMIh6+91UTCqG1aRmt7SOEaYWbxIoYl
         lKeLYK7XcAgxFdqW7XuwshjsxMT3Ar6+uIzrb6trdVtW8J/RY3ZWjR/t8d1oN76Vcclw
         LcuISdQthIJHyZRDOjmcburmZ3ey57LqCAHIFj/G4/oC9EiHUqzKpaJale8t9yN0bUUV
         0SYKo1Oe3wnOdJKLyy3YUQNbbmgbMauJ2Q1d8q2DdfwH/SpYBgx8q9ZrJDT6yvDdTr8l
         4F33D82QM6WkL8u+BuMjCS7XcW89deGfq8el+kiMObbAIHmvm34vij6qxP9qt5h6Jb8D
         PGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789657; x=1747394457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=ulPSHDWDPbP6HveKJ33mV18YC3e/W2lFZyXrZGXB500TS4d+K+t9iXaU/7MXHLYPAK
         lZJRKzmX7oc1Qq1PQMvF6fidrtY4vZbjkzhCoYbWvOlo/Z6FHl8Lier4WtkjYa3RIlM0
         xmINlISRBGxT6jBMY5dPoKZ7xxseWHmnd50BKNZ/B0PUvNNdb2twYgvWY/UiiDtoSrKk
         YOHyqfNEUEuV4nTwah+APMjbRHav9bxWuqTKYeFy0gjyZf+iFShzLVtVjmgFl/WieThE
         512Y4JgvaHfm49lO+0fC77Tuk2AaL7Ce3c+lTsFrJfr70Cgt7XhDevePNaoVpmYZRgos
         0c3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZs+KtjRfZcxM81hq9dWbZrhp1IRT7/qPqskOEjmj/emKfdGVK4ErM7FxfqX0Pw3EcddAkBCU+9A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/MlQPC9yvD5RSjnVvsab+ciLK8dAqk8KlsaUp1HZ1GD+/UYQd
	fM2HuKD7u8vcc5cS7wqY/x2di2/9W6Ae8LtD/eARb126V2sCj1VhEBePeKTzYb+9X7zvdgTyFqE
	Y
X-Gm-Gg: ASbGncvA27KqtOnYiAxl2m7Sv31Nvt9KKtmRT6bzGXVZocr3/3CzQH7xRe2DcbEGqyx
	m0SlYOwl10yUxczka7njAVzyN4R86pmUlgRZqj9+5PfJq45xX6ustB4av5bovNeEvnBCLK6dpY2
	mn5kkN9e/6SXd+y299DAyPsmplgrVb2yXiRJTgbdkU2TfKxYUsSUtSEqUBUBsXKdz/QN7T9Xgmc
	5gVZsKLJSWIcsM0OVnWQQjucLAaClEQ4JI7DGrj7cq44dEpiL7qGWZkZOKSA4tgRNgCtUZpSekg
	bTl315Nv83hCdS8g6h0hu3DkJsZwdazZ2+0xvJ3Or1Cv14cG6zZP4e4675nHuaSOJ/W+r0CicaF
	KMRr1Dz1aJYjc1Q==
X-Google-Smtp-Source: AGHT+IHhcPDh8pSsBNqyKD2nWRDYn4h+n+ZvD9Pi5ASi8e+tMvfh3KEcYvhc33cDnA1c1ksabwra3A==
X-Received: by 2002:a05:6e02:198e:b0:3d3:f4fc:a291 with SMTP id e9e14a558f8ab-3da7e21748bmr40779945ab.19.1746789647038;
        Fri, 09 May 2025 04:20:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10549fsm5136325ab.23.2025.05.09.04.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:20:46 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri,  9 May 2025 06:20:31 -0500
Message-ID: <20250509112032.2980811-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509112032.2980811-1-elder@riscstar.com>
References: <20250509112032.2980811-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 6eec6328c26fe..f4afb35dc6bc9 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -553,6 +565,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2

