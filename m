Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C942FDC36
	for <spacemit@lists.linux.dev>; Sat,  6 Dec 2025 13:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765028753; cv=none; b=h/94Zz0CbxMbe1dpwWft56TVfhuj/5+LNG3Kmi3KKPE3eYAC45frBSdd84zSla7rg31MdjX5FNKOXJmf9w/sMnDROExMv9/U1/We9HBJqkH5l6q4y7EKZbOW0a0Ei45fLjLiHRhUVNeK7zaYvkpq/Ra8UuVZPq3pVoGhqvUOAtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765028753; c=relaxed/simple;
	bh=E74khYf4eC1cSEfdnSoFBPUDpz1eFC5QMvu4ZgC/14M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=djW1HuMSpRMWzhe3c4qf/DTOsZbMpAZTf4W2AvKCLtSVwcweYQGalGn7Wf5HNt2T/8TTyE5ShGlZ/4PIeFlHgdCyKp4dnLWv0ugCDUivVK/4I4NVUy23TuVMM/XWrEfagPQ1W/g9VuMTl3Cv336O1dw2L3gTbxmyd+xfF4gEA7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ng7m3Wfj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ng7m3Wfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765028750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zQ4xZKnyp8sg87QxSnLd/hZTKRSMrQkq8mkt/rnJ6PU=;
	b=Ng7m3Wfjltm1GEe7oRxVHl8sZoYywOUCaD/hDCZYYLzeZd/qKp/AjlyhDMPPLRI72w9eAs
	GfR7pXGewwSMMxZpd58d53nxXRSvmKpD5gQo/tVCUX2ywrAF0frWLfQswqPNl9ItsmH5mK
	0d/VuQA7LSy0cbYYK28u/DLDLWYr5BU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-N2k194HUNlWdlRWQu2oAAg-1; Sat, 06 Dec 2025 08:45:47 -0500
X-MC-Unique: N2k194HUNlWdlRWQu2oAAg-1
X-Mimecast-MFC-AGG-ID: N2k194HUNlWdlRWQu2oAAg_1765028746
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47904cdb9bbso30963715e9.1
        for <spacemit@lists.linux.dev>; Sat, 06 Dec 2025 05:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765028746; x=1765633546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zQ4xZKnyp8sg87QxSnLd/hZTKRSMrQkq8mkt/rnJ6PU=;
        b=ikhPLW1+juldVrKZAtJg1YiBwZlr2iJRZboXMNyVotly+ccz4Qt2GJqBuh3ksPpKQn
         7vnBHgbj9tvuw833W1Gsm2Cqpdp/ARJdhUNHvVA1JDbtAmx8N4mG2Ghcxt/CRturEhVt
         n9yu0lbjsgCZ/rYpPHaUtndVoZ1Z/iQc7ZUAmTmWndQ2cmmk5XzhdYy5V+GYkSmzkfgo
         HtaBYVHMgYWLIkBvFRwVkIKgOQoBpp28mJEw5foR6vUZk94Re+nh813G/HrMfAvEDA6y
         XPOjNZB4sDuONWzskPg2zizmP+C3m2Sjrj7FlPI96XhYu5fHzrEHRU6WPtsSDb44oFGI
         kWNw==
X-Forwarded-Encrypted: i=1; AJvYcCXnn0t3061aOisDkvbgPIWBIwfvPgzgP2zkWVZd7Heaz4FPdQVXOfz2taRM9oW1b3bCGFhJuOSL+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMTdx83byyfpYEU37Xv8RQ7n1oVfiCi+AzzucV2lFJ9cpcyyPd
	/Kgtk2gWRbh6882KeIRyZT4v3C9uQAw3657GtmwhAyC6cbXLpCmMsBnNpDq+XLrbv88NW/UVbgf
	woqnWXjXhMOhsuZbKlaaZbK4t+SQAnqw/txzSQ5W89WuAlrV39eAtUG0Di8ly
X-Gm-Gg: ASbGncsWHYvGWL6wG4M6yW27HUABnSN2dTmW8XTlCch5pLIGo0y2VaGrFoB56zA4TuH
	DM6Lx0NVQZrcJIA/Upj612HsPTy9Q3W8bhWWAr3hsQXxDIOj6AJyv5Dk3uh9hAErO9B+z63mAtm
	nh0p5ksi+FFlqHOxsqm2bq8Z5ht3St8364kFJOl9Vl6EwQ7+09z8DradKO6HfBVQacO0HC3XF9m
	lNSSb0Kncf1RCJvu4QoelkHSInuIPbvLhTzu55Ia6Bv/jVZkk7+n7VIkklSIIuqMz2j8DWxutjd
	yabJqhfrXcKYtY/czdFOp9X9ce9C1lWiDekdnQ61C72c3Yob74OcgtwXgmNspMUm/MfwQ+iOQiP
	PGgZxCaTb+5AEKrhsRlp/fWGwquqRfmoRi7s=
X-Received: by 2002:a05:600c:1388:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-47939df12a9mr26315005e9.3.1765028746408;
        Sat, 06 Dec 2025 05:45:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBRzGilJnm+Z21pEmUUbYTk3gTJ9mW20e4RvI9FI44VoB+qQW6Xulgk1I7L3r+5rqwRgnb7g==
X-Received: by 2002:a05:600c:1388:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-47939df12a9mr26314745e9.3.1765028745989;
        Sat, 06 Dec 2025 05:45:45 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4793092ba4fsm143337315e9.4.2025.12.06.05.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 05:45:45 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Alex Elder <elder@riscstar.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 3/3] riscv: dts: spacemit: Define the P1 PMIC regulators for Milk-V Jupiter
Date: Sat,  6 Dec 2025 14:44:55 +0100
Message-ID: <20251206134532.1741648-4-javierm@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251206134532.1741648-1-javierm@redhat.com>
References: <20251206134532.1741648-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xHAbq9nl3gSe1eixOsbau1N5RHxrM0UpfDQmprrv_14_1765028746
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Define the SpacemiT P1 PMIC voltage regulators and their constraints.

The power management hardware design on the Milk-V Jupiter is identical to
the Banana Pi BPI-F3, so the DT Nodes were taken from k1-bananapi-f3.dts.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 5babed4d7094..800a112d5d70 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -95,6 +95,116 @@ &i2c8 {
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3_1v8: buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
 };
 
 &uart0 {
-- 
2.52.0

