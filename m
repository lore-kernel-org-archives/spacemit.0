Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191C616F265
	for <spacemit@lists.linux.dev>; Sun, 22 Jun 2025 03:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750562996; cv=none; b=nnVLWWC/7pS17ApOuSmQpvFmeoP5lvak+aBtzvbcSReItGOQQqEv6bvIU1NTl2hMtzuCj0nqxkQh069i2kucBGD14ZqrHgymq2CsXiz3HU5Y0tMZn79NCsUxt39S+Ewt7b0HbHhYaXRT8W0OkWNDE5x/cnNGONR7y9U8p2VsquE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750562996; c=relaxed/simple;
	bh=E/I9W6fX+DhSmsmtI3yC9YfnKc4TowcG2XvObw3IonQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcqTqmYI9dQuUUeGx7YB2Qu/+dw7f1AO+Kn4YB2gtZA8dKWly6ZGljWyPhQsJZTI1HUHdZ//h8vI7Lc0iPWCZyVaciCjMRnpKabfSgmob1oTL849FpKdv6wx/GK8BgzXJwCyqIAu9JpvtLdSTobElToxjafzmsAS4Gbq4IGA4mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=hUJwcEJC; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="hUJwcEJC"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fafb6899c2so34362836d6.0
        for <spacemit@lists.linux.dev>; Sat, 21 Jun 2025 20:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562994; x=1751167794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=hUJwcEJCiHB1e2yCGUkD+8nDlzE50iJ3lcArkLKeNmpcpF2SfG1LABY2eAJllh8HEq
         +5Xy7IOZZiRXTpMJYgvRScNddhj4Jnxdabm/WTyv+sckn8OOm43ur8Y/xjfimg4FWiup
         hBDfED+rB3M4ydPh268KKgqasxKddQoOY4Y5iv6XaMWK4V+m0IZo1sq134ToQ0YovKfB
         9+P0pTyo20OVnN+IjEX/iDM8wsK6pdOBmUaspHgGGkz6lKNvgECgjAtZ9w4p0t1ICTOt
         ABRrqiY1CU23xFUmIvVbLuKJWyRDneeQ2twDSp1RBcStnV3gXJzw/gKpAN/P4DQEhUL2
         4Ejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562994; x=1751167794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=IzWjIh6FB9cMepqU2APTBuvzrG0bv37Ny8l6VK2gaRSdpudA5ogr63xi3YQxU/Nfww
         /tsJG4SbNpJN5MmsINQCA2PqWXjD6XwahKeO9FEvLf9ZH+NXZzpFy9RX+zDW4zZXNqCC
         V3Yb8YLFoG5chgE+c7f8JcnFmij9OI+YdauuqctjTYrg5ynK9Eewrp0VZCGRfh0QVrgk
         kykRePnjYjX9ZYNL1IBS5aIfjvY17HvY/nAvla/Q1Qniz33cCw0Ayx8WrH9bRDthx1/W
         a/LUNMxy3vJCPOO1cSPD2j2kWK6CNGXRtwenr8aDf2HsaMruSEURgc5gATdRf4px83D+
         69Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXfsBzaGLipoNXmy2y2zX1o3BV+M83XjTcuzQVH+8UYNi3HBNU85BvS7TgOPJmdfyVwDAsLr/m5cw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFS/xhug1REjY1Ut0IAD/b97goPXto00Td82uWJF+jkaEYIupi
	6EyYXwSRAgg1hJH+goFexY6p2Wo5zE/78qDqVJp26EHj4bD3xTPuSwrEYeZicly41h0=
X-Gm-Gg: ASbGncvS3VDJTxx441XR5KX27vnViJ4qtTIHzDmOKCaF6Wj7kHPwOvG71L5igqpzc8i
	9kxJ2GBnpHauk1iX/kD0OkK5Sbxck6SB2B8CKGdoSSimqkarujaFYoQuwqi6fu1OWrFtbL5Q51H
	xtvUPGnRzHGhm2jFOrEQPt5rh5IMQHDBVbllo0JxLUz7oPTMusXE8LOsgzWmL5xt7cNVlSBmA2/
	IRnfBHTbvErLZRqoTQOHen/DcOfOIP6F0AB/ZqKofdJrSj8/+We3BGjlYVZvyCCYu22jSuX4OCi
	3yTOW43djvfyaSoXdkRRjdi45L1FK+OZLjY0+HzpqfoDkpbb4TtmX8sdU7ODjiHU/X37svXS8i8
	952KhBlx9tmzh8MrYU2Q7GlaUC9ecVQEXJdg=
X-Google-Smtp-Source: AGHT+IFx7soANp4iyxPjh25Qy4p98v7iDm54ya/OEbJv3+HBB/XlyEpTgKQt20ORZjbaNTVgNKCyAQ==
X-Received: by 2002:a05:6214:3385:b0:6fa:9ca0:c67e with SMTP id 6a1803df08f44-6fd0c87da04mr119950596d6.5.1750562994099;
        Sat, 21 Jun 2025 20:29:54 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:53 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 6/7] riscv: dts: spacemit: define fixed regulators
Date: Sat, 21 Jun 2025 22:29:38 -0500
Message-ID: <20250622032941.3768912-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2

