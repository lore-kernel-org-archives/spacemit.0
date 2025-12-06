Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDE02FD7C6
	for <spacemit@lists.linux.dev>; Sat,  6 Dec 2025 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765028746; cv=none; b=AvHyPNw7Atw2h9VsLZi80QjuBBCpYqvQLmpdqJA2+buOzObnUZMNBgcFBY91tYoLnUgeOHoePqnEV3Qc8XAwwszlq1Lu1qbbXTIvuxxePWEgbMusVQIA1KjZoi7bQRGgDaqrL1t1ctL8sPuhzecYFvlqRgArDw28j+nQBwWBtlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765028746; c=relaxed/simple;
	bh=7+AslydEz8tbIwfpmc4WKUHRvN7NmneaD5WL6Wnp0x0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=F5h8GazvPA/IamJgjVnnSjWCOtt6WtOFFeeHIJSqAHTMO/UOwepkJt2WgReaxIgEa18awHdcak4gZdAkL9OhCmugXAj0CQOiJ/fN29dvjIdmel9K30iTHXGczn2M5yRJimzu/lIjutOEwv6oJPfToF85S1NjZmTdGD+nkkCX9xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MW1Bf4+R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MW1Bf4+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765028744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SGJ/YBkwQ5juZyABcErVQlUL02+/JW8TWX/SMrvHfxQ=;
	b=MW1Bf4+Rx2o1QsvkRb+I/8Lypr+MnppSuVRzLAr8erGfaLNWTdAFqUb8t0QcDHJ+09qw1B
	jRHvmm0GLCyaLNVou5tzLu9riyuaO6t5ZNRX7NbMviJ2qsbNsp4eN3qFcbPTdENysLSrnD
	Q+S2zIHQlkMH1K2RQoN2rUDm6mv5CZI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-LPNZHGXWPw2OKKiZFippNQ-1; Sat, 06 Dec 2025 08:45:43 -0500
X-MC-Unique: LPNZHGXWPw2OKKiZFippNQ-1
X-Mimecast-MFC-AGG-ID: LPNZHGXWPw2OKKiZFippNQ_1765028742
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42b3339cab7so2596434f8f.0
        for <spacemit@lists.linux.dev>; Sat, 06 Dec 2025 05:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765028742; x=1765633542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGJ/YBkwQ5juZyABcErVQlUL02+/JW8TWX/SMrvHfxQ=;
        b=G50wEM4jxY8sKaN7Fn46NKGXqmkUEdwbUKP6logzBHHG53e4F6cJMMP/hnHeZZtYT6
         T6qxw/dLvkO51T4U2PsW2rmGaZDgv0gGyhPHTOTApKroiSKqUtdyvAy10io6McXqZKQ5
         bMdHjFRT3QbiEXjBk4WoJkp/SJ2prEsuu75BbagAQpGpep+/UmnyW025K/C4QsoR1lsk
         uykKkNSt1+xF2zEFdFNueDgWjEo9QfVGbt4rV6E4KpP9TZ9mYNl/P25xC0s+dYPutZxA
         VNUnLpx+9SBFToZy4Rtt9NmftLYY742+IACi5hgpd+ciNJl8Wva4c0TF5K2Pc1+1x9Hr
         D1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCX5KCEnS4xGq4OsO1i0dVa6tYy9EfI6/EK20EZUlxILMnJk79yv4iz5Ez0KMLpiC/okJHyZcO+5mg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs0oYhq01XaaUJf93R47FcFvm8gdD6/EaEhMQRBYYxpMWS91WZ
	3A2TZriSZdlDH4XtywO3ey9vAADiu74tU32Fdo6nEOykZtxla8jC/EgmWKw07dvdbVgzNsPns+n
	ogCm+gYQtJBv9vSVVh/xO05IHyZS0N3VuO1gqS4+uT8SFb/nV5kl3VkKr3z1B
X-Gm-Gg: ASbGncvA9IDeeRyqV9GP+VkJw57CL2C0BHn35KrNAhADCHKgYjS8srCSVLcxq/12Zx4
	VdmSjUz02+qeCRegEJCx/Zj5xpBDChRlPzN//Ic20nGdpdg5FBxX0asvQIA+HA8H/8wQvDmRTiN
	hUE3uyBvmgOHrei11ybIn7R5kaUjsMSU6beuMvM0gG9pmQxvzp/N3K+JoektRNwSnmIfgwSUd7v
	m9HX9dxmUARscUKg6e+DgtEC46bf/SQDJgyz79hRlQu5/nZ8ZRm7MJVuemj0H0g94KPKv2Z4pKm
	Uk3vXQokNcOgxtBN0+0hmXz/LWm5GmlaLJdhY2zvpyNaRO6hK1yrCH3U9JxxEBmTPRWzcviT/7c
	l9Hh3g3F4ubdN8qFnPLltUWKZwKmYiZDGRqA=
X-Received: by 2002:a05:6000:1863:b0:42b:39ae:d096 with SMTP id ffacd0b85a97d-42f89f093b8mr2876376f8f.10.1765028741669;
        Sat, 06 Dec 2025 05:45:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8K8x9eGlvEeI5+9B89BZvFAXX9KzP07SGmLffrHPHT6uNDDPlREapDk1gOmKWFS75ycvHSQ==
X-Received: by 2002:a05:6000:1863:b0:42b:39ae:d096 with SMTP id ffacd0b85a97d-42f89f093b8mr2876336f8f.10.1765028741201;
        Sat, 06 Dec 2025 05:45:41 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331af5sm14206871f8f.31.2025.12.06.05.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 05:45:40 -0800 (PST)
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
Subject: [PATCH 1/3] riscv: dts: spacemit: Enable i2c8 adapter for Milk-V Jupiter
Date: Sat,  6 Dec 2025 14:44:53 +0100
Message-ID: <20251206134532.1741648-2-javierm@redhat.com>
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
X-Mimecast-MFC-PROC-ID: -TX5KkEkU4s8riF4KWcWo1uSh0dTRvwPzh2jsU3VO90_1765028742
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The adapter is used to access the SpacemiT P1 PMIC present in this board.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 28afd39b28da..aa425f02c1f4 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -72,6 +72,12 @@ &pdma {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
-- 
2.52.0

