Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177D62DB7B9
	for <spacemit@lists.linux.dev>; Sat,  2 May 2026 05:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777699188; cv=none; b=ZnFugHAk+2XLUpDCQoo3TyOqUsTGNIgnOZ99Jr9r3xhNll8XiySZwMk87gnXjd2oPNsmaoXzNTc+4MGx1ncV14nLTjeq6FjnG/0/CRsCqzjx5bwVsJdNFpB3D3CXceQcZbNO3W762lUzFNWbqnYOdCKH0zLjbX41CWf+agy5v6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777699188; c=relaxed/simple;
	bh=yfZLqzjYntGSVbi4DA8iLQYeqr6WqJadGNo5LG3i+Lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rXUnsK3iPOzHB3tniXMiO+aYKaawN4CwqtQbbJo87Oy8XerW28heG2tylrr4O4QhzGPeCiL6S5bnwlvZwHK3saAuD+SNKvI2RoF255XCQ39EM5+IP7WhPheWl+UvffW3KFIcz/AoO6N45i0NAXBq2aiH1gYcGRVI6uNiOFe4ub8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jx+FNH5G; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jx+FNH5G"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so1862042b3a.1
        for <spacemit@lists.linux.dev>; Fri, 01 May 2026 22:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699186; x=1778303986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdApWjaHRT3KmgOlTPslnfl4o6cjdKhl3SDC6pKKciY=;
        b=jx+FNH5G+qssDZF6DyueEdg/rd3Vi6ztW3r1Ic3dZ/5Y6q36p50aOWk3j6R5S1QW+u
         JRp6tEE0gYLCXJjfoY5AU6e6Cp3VAVuIV3WYYOgoe+8YMfVMbFITkfISMnMy8qwn1LsF
         TMi/xyT0xksOtHHckxQ1cAYITAhH/L/8mpJj262KqJFcj7TAzSdJSE+GfLMEyAWC0V8m
         lhcuudgvfM41+SHq1SmtqKK1OJFlUjiWMNgxv7Q9PtmRs7BusgZNlImZ1l4mk0GKC7Kx
         I6QCr4le8vB3K+X+4y05AzmX9K+VnDOMeSwWcz2UK4Chsi+jHRpG+DheLqyQFLZO1XwA
         1aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699186; x=1778303986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdApWjaHRT3KmgOlTPslnfl4o6cjdKhl3SDC6pKKciY=;
        b=FOYNPFa03ZsgLGzD/cXG+AbJIpVqjrJ0XAxYS0W2Fis3Ri1iXK5pblrKECUTQwLF8G
         ZrPfk8selaRmjK2YT1DS/tzhp0xOhaSvuuDJi5RXgs5vCT/s81PVUrICRnM6DrGhJqpA
         Dd7VRiUADFrVMK0td6BGovEL1zmsxWNCbSU70sURU5Y7dsxHloLFR5nD5QlKQGAgcMnM
         Rzspq246q2i8i3NcTehzJw2Lv+SjHXm5D7Z9szxl6j8UxmScLyqBrx8rgbXfys4bU99q
         iKYInimrjCHMOPa/S5AQ/9nDqI3NiWBXi8yF2ZV2CaA+491g4leOiY5nJwuwZ2ElBUjp
         QNKg==
X-Forwarded-Encrypted: i=1; AFNElJ9EzQblU1405ldGB5u/7BrDpHLLlXGu9OI/KQb20OECMmvcFF4rzstJYdtVrvDX1dD7C01pI+NTTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZrX5hr63+1jaXzeJsJGm9OhPJ87A9xVThAVirkmWP36cSIYCu
	5MWEmTYMlZKtrscOnt99BePYyF/jNnb/qP/gYg3kKutsjwfjjnWTz0y8
X-Gm-Gg: AeBDietkbpO8laBjnmqu6xUXi6OM7lOP42V5p1uG9aqAv/BA40JVKftBp92c48pQig1
	rRiEjAda1BVve+GMcjv43SVqX8FAg3esmQzsUM5czmRPzrtAViR/xUATBKciTOASjXnG8Lv0GJf
	gj0iNRi3V3GhbjOZOD3HAfruLj7hWHQVpFhrCS7AIEe6J7/cam3dD3YrJkhxxg3ly1mf3CXzvOn
	t8hmjO+7iq4GOss5kJ6nvrTZuBIy8U6MQJ3h2W8G4v5emcrBGaxkcBgrjNCjUF0mEZXaz5JTrCi
	yx5aOeRBujzBlDcYcor7j0/udGw5NHCQGluy19SRfy5V/YWtkNa6wKrvrmfdLV+8ZRdmjnhXFY1
	Kh6IPNHZULQhd32izCyinBQecxtqpt8fREkXo+wjr5vjNwpKwE+JkUuPrfgZ1L7JCDsbFQZA69k
	4YNbmpieCW7pJlwIXFplmfIYApoPXxvsHpvfmTTjY0
X-Received: by 2002:a05:6a00:2d8c:b0:82c:7335:4f71 with SMTP id d2e1a72fcca58-8352d22cc38mr1915843b3a.36.1777699186327;
        Fri, 01 May 2026 22:19:46 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:45 -0700 (PDT)
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
Subject: [PATCH v2 4/4] riscv: dts: spacemit: k1-bananapi-f3: Add vin-supply for PCIe 3.3V regulator
Date: Sat,  2 May 2026 10:48:57 +0530
Message-ID: <20260502051906.8160-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260502051906.8160-1-linux.amoon@gmail.com>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe 3.3V fixed regulator node (pcie_vcc_3v3) lacked a parent
supply reference. Wire it to the 5V system rail (reg_vcc5v0_sys)
via the vin-supply property to reflect the actual board power tree.
This ensures correct regulator hierarchy in DTS and allows drivers
to resolve supply dependencies cleanly during probe.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: new patch in this series.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 3dbdf53b6d8e..6c06480ba100 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -39,6 +39,7 @@ pcie_vcc_3v3: regulator-pcie-vcc3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		vin-supply = <&reg_vcc5v0_sys>;
 	};
 
 	reg_dc_in: regulator-dc-in-12v {
-- 
2.50.1

