Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708C443B480
	for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 20:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752297; cv=none; b=toVi3WV2+/CKXNeJBR9WeeXV60xvyVyKaqGHj6SxAS0nx10VHj4jdK1QedwihqJBfK9HUSZWkx/E9nMaqk6h+8D3aHAD6jZGO+eegAHGi66ElHjsEMi/AQNuJjlFLd1MSkhrc2K4tGXXSgpEqlpEgUQV1RUPs+zIjjJWxDXR/5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752297; c=relaxed/simple;
	bh=UoEo+rWIkC1aWNZcBUOcKadFyb1gPIT26H0nu88T1XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=F4UX4zI11q+8vBtt2LUIljyOoZcyj7Uil9fGb0blBBmVcndVvBjgsi+1CQZJxXfXZzgdAYZvuZe2gOz1vpgKwBexITSuGryycuxjj7pJRlC6j8lo5zNVwAHP3Fmhe97JoTudo6fBeG8XAhqhvkoHkbCHADfBS4kkQ01fHLExyIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DWnPOKWE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DWnPOKWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784752295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8Wg39SYXO0JHmLOHU0723C4lSHO7cWpCqGrL2pJzpY=;
	b=DWnPOKWEx50cOKHFRdpT+J01MJroWvZcXH/TPJQuVZY0tzz8jfkbv3qFOV8KIZcNkmCUoH
	wa7BZ1xGaC67hsNiI01htXs5GMumTRumwZ77jUyghoPxb3QL0/ESL/b3lkYWbgfZNLv5wu
	kqmH2MiNyAZDu3T/kKd8kI0Dr/ibUEM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-UBPpSsOkMR-hTtx-mzQbxQ-1; Wed, 22 Jul 2026 16:31:34 -0400
X-MC-Unique: UBPpSsOkMR-hTtx-mzQbxQ-1
X-Mimecast-MFC-AGG-ID: UBPpSsOkMR-hTtx-mzQbxQ_1784752293
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81df8abfa7eso235534187b3.0
        for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 13:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752293; x=1785357093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8Wg39SYXO0JHmLOHU0723C4lSHO7cWpCqGrL2pJzpY=;
        b=s2SFQ2jv4MjEif6dPJMrRcYbTBlGaIOIk/QMg7YntR6GcEPXyUmZJO5IZVFkCoJBYO
         UeAS/BklPG+3uQVTaAvTQicW0Qrnh9ieRJTySdl12jzxRG+5LIoZEdL8W3ATnJzVUNrA
         rmLSTHpdEYUUW+gX3xY7ZufWV9qKEge3ShBWWvfuwUvUsEhsmCbifTkKQFfwAniIcdkT
         SZwA0XSHgdrRt7e5A2rJvfFX+yfs1CopeQz2HLGtOrxIi57mZJ17BambufHzFzA8m8Ma
         nH6QfpGB2YDRDmpLLxDtcarEz/h6ILPZZf1yQKHUzTLGhp9almIpBVuyhqP01KshDAt5
         dYtQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIjuOJJbyRoJ1j2PqGA2KRQV0ruCRN5j/si8qchCpQmlX2ywm5IsmZqv3YLHgxiJI3D0z4o4a+HA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFz8PKEkoQmfLoVSkhQ2jwss2GPLgpo/7UeVUC2kgeJmzVdpn7
	KqfSpG3+WQ5zAmBK0Zg+ln6IFFjNS3r/ahoSMjE4n1EuPsaGlaYUl7xo+AnNwNJyBhBOWrGfLxA
	GrowD46s91V1imtU2s3GzQwsu+pMuGJksmFR2bT8pZEzu+ZH1/2VZlc+w7/o/
X-Gm-Gg: AR+sD12empgf0J3bIGquQQFdRw2Gcscgqyb5EZFMx6jOivYlV2+sIqaYaWlMTYCjEb4
	oXXGVyld5SJ6S7ceoc/v41P5Zw7E0pPWxUgMH5zy0jgoQ0GjpsU9G0Qv1KAImEm+XE/tqKBO2qI
	/4aQ+0YhznnDr3OA091Nxu+hVmkkGz52NLY/0X+AdR+ox5MTiGLy+TsW7pjdZfbJNRYpLwITHea
	y6noc82MLfD30GCJia9j00k9CZM84lWLjCZAFOB7k/PEVfFyllIP4yBqR80aDWlA8Nmvb40NNHP
	V2Psi2/W1BwNOLgPnbAL1bugeyw1p6ALXhjA+LW4wjmUqVqQ1JRnKg==
X-Received: by 2002:a53:df51:0:b0:667:c93a:82e6 with SMTP id 956f58d0204a3-668a4cacafcmr40417d50.44.1784752293175;
        Wed, 22 Jul 2026 13:31:33 -0700 (PDT)
X-Received: by 2002:a53:df51:0:b0:667:c93a:82e6 with SMTP id 956f58d0204a3-668a4cacafcmr40395d50.44.1784752292656;
        Wed, 22 Jul 2026 13:31:32 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668906d9344sm1923573d50.12.2026.07.22.13.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:31:32 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: k3-com260-ifx: add eeprom on i2c1
Date: Wed, 22 Jul 2026 16:28:48 -0400
Message-ID: <20260722202848.1817988-3-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722202848.1817988-1-jberring@redhat.com>
References: <20260722202848.1817988-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9oUv5i1Zyhx-dIzaeHlmy28aTUnkhXX3ve2cTwP1QuM_1784752293
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Enable i2c1 for k3-com260-ifx and use it for a 24c02 eeprom. This
eeprom, unlike the one connected to i2c2, is part of the carrier board.
Some boards do not have any data programmed on this eeprom from factory.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi   | 12 ++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index e7f76cd24b903..a5c08a7a781a9 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -20,6 +20,21 @@ chosen {
 	};
 };
 
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_1_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		pagesize = <8>;
+		reg = <0x50>;
+		read-only;
+		size = <256>;
+		status = "okay";
+	};
+};
+
 &sdhci0 {
 	pinctrl-names = "default","uhs";
 	pinctrl-0 = <&mmc1_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 5b9045e014345..6482d24be1394 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -78,6 +78,18 @@ gmac1-phy-0-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	i2c1_1_cfg: i2c1-1-cfg {
+		i2c1-1-pins {
+			pinmux = <K3_PADCONF(54, 5)>,	/* i2c1 scl */
+				 <K3_PADCONF(55, 5)>;	/* i2c1 sda */
+
+			bias-pull-up = <1>;
+			drive-strength = <25>;
+			power-source = <1800>;
+		};
+	};
+
 	/omit-if-no-ref/
 	i2c2_1_cfg: i2c2-1-cfg {
 		i2c2-1-pins {
-- 
2.55.0

