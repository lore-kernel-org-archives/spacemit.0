Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B9C438029
	for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752296; cv=none; b=peYMFttlV0oDB903zhITDwiPHRfBNMIiJobXVqJXc++h2rGRn05kQC7LvRg1/JzXKgZc+e3cYuDMTomATBpouFV0lNJSmbNvKpL7UzwqseAkK6rdmu0V202bM8j2dAWHz1LN2BHzvwMG9xHOPyUu4RcnJrPLoiNYYQHEKuwyhow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752296; c=relaxed/simple;
	bh=ej7MF+RkX+ntdWc2Dj/eHFF66Qpw3vFR5EcH0ZPrVOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=JTGEb9hofNmqtwrRXrVi46DOdWZvdJPi7EiPtKjcCTcFWW1nVKZuMQdu7IhyTPaa1iqja00c64/BI8sYLOQDk7dNMrsTJrvcBrv25I97H3uiEDjtpwloevSKInsLX65RF8q6Up8tF1rEGJoddLjR3lbWPOcp5RXxZJFu3ZD96Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HVn3xNSO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HVn3xNSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784752294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HO7EY2uSAl2r3/4QPFjAWAR2NbBnS+jBGqUz+JFZA0o=;
	b=HVn3xNSOFktwbQmTz5d+Wgmfyw/Epa6Thqev7Z+QkG0LyGobu7kI5dTS6zqBtrhKou3ukM
	kzerD2CppoJunn3mf30lppXD7roVJ309hf0MHZJrIYCzXD4MSclFwMhmPN+rSmi0B5ZVFN
	nc9O+tNMdkF70vZPbR1otmoBuTAoDSc=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-9rkM66kAM_qjvIGXu2Ebgg-1; Wed, 22 Jul 2026 16:31:33 -0400
X-MC-Unique: 9rkM66kAM_qjvIGXu2Ebgg-1
X-Mimecast-MFC-AGG-ID: 9rkM66kAM_qjvIGXu2Ebgg_1784752292
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-664a78ea304so20750403d50.1
        for <spacemit@lists.linux.dev>; Wed, 22 Jul 2026 13:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752292; x=1785357092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HO7EY2uSAl2r3/4QPFjAWAR2NbBnS+jBGqUz+JFZA0o=;
        b=c61e/K4IvpCTjv7nTdBGPB595BFCaf0pp1C+hZB537Y6LiBk4+3maigO/5d4iH43si
         lOW5u/2l9gqPthfAyuCcdbnauM/FIcFM/pFrloFB4bDJyxBqJ5CMHxKO0G7CqH+42c/0
         oKJatKKI2epRYkI5N99o95slJJNBxR0paCU+dXcbCmbvijrbR6NCgsMQ4wIno952lWoY
         wUegu8XHSJ4RcZXYXp/G6QYGiDW4UuV/1FvmDSUJzgoUe5lse93bwrnDY8byyxSsFweQ
         GegYeoQh9sxbVsZ0klW++F3sZSfQ0mbyG5rJl4fswX0rTJW8SOSjgZSJ1QWXz6OS7/pn
         glYg==
X-Forwarded-Encrypted: i=1; AHgh+RqCGBYi2Dh2ppBnm/OyEbmfBayk50TH5122IBU6WY7+1S2pFdyaw+l0ZH6tP8wXKkKGTl/rf/wYHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvGIo/Hn2PEcv+8mFAGbbvElsNHUaTpD4vRUkrwhYWGb8LzQVp
	qFhlfu7L4ZLQrVDAjoiZU/n68mmskDHX+xn1VVnSGiC1Djq+16Wvom842HvS8iKd1aaGtOKbJUH
	tjsnja/52f/mn7VRK+5Jlk1iXun4bEPwOOcPxCExFL8Yb1YvitvFqUyxoyCX0
X-Gm-Gg: AR+sD11Skeum+Mktwgsq944/EXWOiWUdsDONNGLStXeZU41/ePRIk0q8hXgH/iCMiCu
	yi3sgkfoh8wijH39EnrLnwgYUbu5S1dxlLHjdmlz+1rXX1VqrR+NRg8GnHyBeLsHUCIpyPEAmEM
	kpLy1gcDmsHBA7L1H2TIQFq0G1tG7pCVgjFJpX7g+8mLlYlzSYI5wZ3G/epVyjHvTeURPXI+/Ll
	BJMhJxXO9EehU+q9AmCdg3KkESd2LtbM/6uu2AsGF4khxhWZ7Glty6Z2s8QiFsdzLn/T4VjGWec
	A9GASSzyWgXf5tRAY/7F4YRdUjngwhdYF5GD/gWnptFK8Q3C5b4FCg==
X-Received: by 2002:a53:d884:0:b0:667:b238:873a with SMTP id 956f58d0204a3-668a4fb48f6mr21504d50.86.1784752292281;
        Wed, 22 Jul 2026 13:31:32 -0700 (PDT)
X-Received: by 2002:a53:d884:0:b0:667:b238:873a with SMTP id 956f58d0204a3-668a4fb48f6mr21488d50.86.1784752291660;
        Wed, 22 Jul 2026 13:31:31 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-668906d9344sm1923573d50.12.2026.07.22.13.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:31:31 -0700 (PDT)
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
Subject: [PATCH 1/2] riscv: dts: spacemit: k3-com260: add eeprom on i2c2
Date: Wed, 22 Jul 2026 16:28:47 -0400
Message-ID: <20260722202848.1817988-2-jberring@redhat.com>
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
X-Mimecast-MFC-PROC-ID: -k-7tcfDyGrluHOuesiLWzuWz_Du5dNnBL7HFGlHWTw_1784752292
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Enable i2c2 on the K3 CoM260 compute module and use it for a 24c02
eeprom. This eeprom stores the product name, a MAC address, and a serial
number.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index a38d7b738258d..a6f160dca19de 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -26,6 +26,38 @@ reg_5v_sys: regulator-5v-sys {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_1_cfg>;
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		pagesize = <8>;
+		reg = <0x50>;
+		read-only;
+		size = <256>;
+		status = "okay";
+
+		nvmem-layout {
+			compatible = "onie,tlv-layout";
+
+			mac-address {
+				#nvmem-cell-cells = <1>;
+			};
+
+			num-macs {
+			};
+
+			product-name {
+			};
+
+			serial-number {
+			};
+		};
+	};
+};
+
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
-- 
2.55.0

