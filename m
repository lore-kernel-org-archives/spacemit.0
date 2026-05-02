Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C1D2C0294
	for <spacemit@lists.linux.dev>; Sat,  2 May 2026 05:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777699180; cv=none; b=ZyG9LAVr5GogTcDNxhZaxKaJncBZz5w3CWJVF7koJXL9roG7vve6KBx96j/UEyv5Z/kor7eEswAZzejm++oB4Dl3IXxtIYIVNP5lVaTmsK1ViFSv3ycwgCzNB/EA9X+ZyBJo8rnFOosd3aIS8Px4F0gAcvdOrSbOrLBKRSc1Kmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777699180; c=relaxed/simple;
	bh=qtCc8l42iSpmlm+/TE+Dk6gRBzfUYNmSbZRmXlS2lcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H8fc5s3xUaT6MzXrEp/WyOT2BIADmUvezU/ZPzGLatbjD54IDXC37W+tnh7FMaObMytAo+0qPv14wbu4KDRZ9q1h8zYp4ekGKoBIyxIMYrPcHus46/9qJ6Kg7d6QxtgyGtX1LOHr16pDeV+l9aC/+sVofgy+1kEHbSWF5ckNLsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qysHbIj+; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qysHbIj+"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f69a286dbso1763176b3a.2
        for <spacemit@lists.linux.dev>; Fri, 01 May 2026 22:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699179; x=1778303979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=st+hd/tvQPpc4k0FLAyCqH2PohSvbWSzsdcaPi3SVuQ=;
        b=qysHbIj+Na0BqzvwiOrguBWoA37ECqHob6CsRM/9WoehSsOU58kzu3KjvMMz5hHztf
         22iWAL3UcGmTiuioFvnTaUXz5sybmWhHOj0yQU9ouFbBORAoVTWpE8Ar6KFs+jb+bfsD
         8qtticSNeuINsOQRRJ3hsTXhntV7EclJGlhahlSZdbhPizY4kR8QlIEp1jHK0Ni0KG4f
         R2WZVHo+abhYySJ9PRGdtW89dutuCrjhDs+U56er4ezuBzynKBoShBkzPFhARmUmmPPD
         Eiumi8b5R498tmGBNPYQHxQM9oPYvPtuPN0EwsAF8c2iyR6knsTiW4pwErglCvlBXuSk
         RH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699179; x=1778303979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=st+hd/tvQPpc4k0FLAyCqH2PohSvbWSzsdcaPi3SVuQ=;
        b=ZaHY6r/wBQmGfzMUBlVwWowIyEJFF09p/08uh6q2jozisgt8p0Fxz4TWZ9x9gkgs5v
         re0iFkkIqWWg47NkEOcxCEQFVJupgWKVq8EhaETtJULiRJ3nBiI+RsFolXWPs9VKjUcZ
         96F+Y15kO/7JxxRqW63/QhCcdnMTV80QZmBksPSzSBg3u/azKC7tAQzggAKT7oxXUPCJ
         7dRspfQ+YBUKveaQ6uaEmBldtsQ0HrkmpHnq4TGEOVOJGFvvDVLTtU74JL38xPlgnrg7
         Oo344XgxrbvIUGDPyo3AqNhd1SS5Qtmj0t47jSziqCArGgwipnaml2VW3C5Waq+HFaxA
         zh4A==
X-Forwarded-Encrypted: i=1; AFNElJ8vKhqEndfLSY7903epAQqUZqCKHBewZX63sUZAINDe3vW7MEceMXcq3x40TeKUFLR4AfMwxB5M/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/qyg9c3Q4CbveDY/ue0fsyQN3i4N3pmSS5Zo5Gx+gKXxgULT8
	Ro3ep1w8WpuUZl1DUF8Ht1tK77+98T84ASho+smfIEANw8TrA4CiemXR
X-Gm-Gg: AeBDies98SkWqntyamyNYqueUph/TeJFwR4JQE5l8WOMsXSUnB2YnLZ7t0Y+6DE3U+p
	UMd++WqWVpxKt/gC0ItSdKw81/1YGSmLOWKB7yDzcm/DWbg2yc7sya/rwNooXmllL5CQhv2DWK4
	bo2bO5gfry2mhft6vhfrnbMD8eb5FQqxpK7IaMKQtMJKtEYx2753vb+zMamJhcH1Y6Uk0dZR1sj
	IyQmvSdWHYUU/zL6iJCXOP2JwMTY377AHdivHNz1Tlj5/WPTGRFyf2SIZACLFt2iYXM4mwaPVGa
	nqlKynAwnYmmbZdb0MkQ6Lz8xR4gdsAfBuCX/GUkgS3DSrhOrd6iusl8miUHXaN9KKk+rmDbhhw
	t8L2EkJPcfUabrFFnAL0dPnJZdqkmu/H1fDOvQtDJ63S+YSdCvQvQ97K9xl4GQUOn8Ek9Xz69LS
	jOLPOvt5URch2Gvbc8whbSsiRZ9dT/pQ==
X-Received: by 2002:a05:6a00:4188:b0:82c:6b46:271d with SMTP id d2e1a72fcca58-8352d29a99dmr1858138b3a.48.1777699178931;
        Fri, 01 May 2026 22:19:38 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:38 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 3/4] riscv: dts: spacemit: k1-bananapi-f3: Correct USB hub power hierarchy
Date: Sat,  2 May 2026 10:48:56 +0530
Message-ID: <20260502051906.8160-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260502051906.8160-1-linux.amoon@gmail.com>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Link the usb3_hub_5v regulator to the USB controller’s vbus-supply to
ensure the USB 3.0 stack is properly powered as per the schematics.
In addition, align the USB hub regulator with the board schematics
by renaming it to VCC5V0_HUB and marking it as regulator-always-on
to maintain power stability.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index c35f4763c800..3dbdf53b6d8e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -83,9 +83,10 @@ reg_5v_vbus: regulator-usb3-vbus-5v {
 
 	usb3_hub_5v: regulator-usb3-hub-5v {
 		compatible = "regulator-fixed";
-		regulator-name = "USB30_HUB";
+		regulator-name = "VCC5V0_HUB";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
 		vin-supply = <&reg_vcc5v0_sys>;
 		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
@@ -361,6 +362,7 @@ &usb_dwc3 {
 	dr_mode = "host";
 	#address-cells = <1>;
 	#size-cells = <0>;
+	vbus-supply = <&usb3_hub_5v>;
 	status = "okay";
 
 	hub_2_0: hub@1 {
-- 
2.50.1

