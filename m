Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07D82FDC4E
	for <spacemit@lists.linux.dev>; Sat,  6 Dec 2025 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765028751; cv=none; b=k0isU6BeJRNpsj+us5C5EooNto/z+TUHKzkeb4+dNg0kv5Pb/Js6/GyKX1PbwvOoM2f3tQMKd0A4aqjfh23kCy2hoT1Mr7bfZvUQykAJH26bs37qGjYCI+7hKiFxz78iUA8nrR4CbbdFgW0+zSy2xrTTqB7kyGXx8Lnoy56cL9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765028751; c=relaxed/simple;
	bh=nyKdGstoW0qnQQu0e2bc18eMwwgKdIJLvnupPfwhtzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=gzOSBIqI6nd8hT8c9hnV4UIrSB4GbrJPUfghEqhq0ESdfsbiu/TLhe7r/OUrrRjR4xvNi8HCAC1/Jow0o5YsxO5zzmlgnGY28bz7CQaD4buhh4mN7VeX3qSkyAtiNVk3Bl3JXN2yznrOaDqe/bOvmPgxXkKynhHX1OT/LclZzZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eL8pmSts; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eL8pmSts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765028748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7PpSxu0uoTQw/bfHDFduC0nyICCWSnMwL2fSnPGX/mU=;
	b=eL8pmSts+p9HSM8kFW/c83hv/TD7wDn3DrLAg8KLCFZyCw1agDvenb96aYEZ5v7EQoVAPS
	HiR1RYuFMrilBiiDF7DlKXAv67+8w064VsdJGAhNcrmJ9gLwIQXpeWlUQ2cLqYVFFBgIqa
	QkRpWz+36CAs0Arg6Xi+XDj020hcRbI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-jyzpv4GnMqOOx9_XRLNiTA-1; Sat, 06 Dec 2025 08:45:45 -0500
X-MC-Unique: jyzpv4GnMqOOx9_XRLNiTA-1
X-Mimecast-MFC-AGG-ID: jyzpv4GnMqOOx9_XRLNiTA_1765028744
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-42e2b9192a5so1524282f8f.0
        for <spacemit@lists.linux.dev>; Sat, 06 Dec 2025 05:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765028744; x=1765633544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7PpSxu0uoTQw/bfHDFduC0nyICCWSnMwL2fSnPGX/mU=;
        b=nkG3xPzLo3Em4LHL5vY0/vbETeYirt1QDY0jMunLCLyZPYImRtkwGUP+65iQMHreyE
         pYjTIJaOUhmEVvMag+zVlSX8c4gSBld4d3gQa/VXtLa4YmNF0qul418zEfQXE2LDmQdf
         RqcvpjgBNjvhmTEJM6KBgPO5UFpqbxhbktGjEg8/d93j5k2af2Ncrok7LUfLKX4x5+Bc
         UpkSjs2ECSkbpNVIMYiRXgJladtCysPeGDDBYmhAOUcC/Z8lP9cWtiwikYlGyG+xG4L2
         V+27hr37Ef+Bx3FpZqO+R9HvooFbbTs6srNNUE4aFiXuK12wOWeUmJyaUIb1Awt57Ryo
         UPcg==
X-Forwarded-Encrypted: i=1; AJvYcCWvfPjTmddnEeEQzco7VAxXHvMyUUD43KaTs0s0V8MBqNo8Mb4S4Z9aPIG69B2BfWlBxkxJABeltw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo++pWYaZs7s4iPv8y/2f1osPjDPstd6Owmh2ZnJZReRzVB+6k
	MEbhu97WkkwCZMky+6nHhhjFYSydRPVa1XpPF6M+eoo7I5aPYzAf16sq3tjoX+OLOCrQwFCaNSA
	Htdljc6Mc7/jQrT4sdaRuLnUfFUQTEQt0ADpIX+q9w65jhEdLu4fQXqmZ+FXj
X-Gm-Gg: ASbGncsHCprx59rRZlJrucmjBuQ3eZFppz56qK4YhcIum7r8Vc+qCziHwkwpjDO3fvO
	w7H9FG62zIV2WG5fe6FvzU2ZAmWwBHpBSyEdxlQ54isPAQRPWX6vSAd9zvVlEVX2OZ3ayr3rvJd
	7LtuVpX/zvzIMABt/x+9xMHFOvIFtrYwOJxh83742xy/v49jfTFwnZSe+3oYmAnX5etGhPOqb7b
	BxjRxIheh/tHzlbfY3zA6aYbSNTbSI/4s65fk52HWooWXYWc6subNR/4RZeznBIu9VJAdE16FUg
	U7uI5VGw8I/xXXtPFYTWXMZendYcSXgQZRvIZw3VrJH3txwVuy0ir1g2+SD/diuxVcZ/wvy9aBT
	+RQCzHcSkSv72FW3tZAicrjbMZvWZQaXcyws=
X-Received: by 2002:a05:6000:208a:b0:42b:3afa:5e1d with SMTP id ffacd0b85a97d-42f89f0e1f6mr2491527f8f.20.1765028743884;
        Sat, 06 Dec 2025 05:45:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjfQ9aaQ81hkEvl/6jCgpaRsHR00kuYXGCail9JraZcQS5ddTMpKEXXaLIqt5hbjfEo6K8hQ==
X-Received: by 2002:a05:6000:208a:b0:42b:3afa:5e1d with SMTP id ffacd0b85a97d-42f89f0e1f6mr2491511f8f.20.1765028743424;
        Sat, 06 Dec 2025 05:45:43 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee5bsm14698899f8f.16.2025.12.06.05.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 05:45:42 -0800 (PST)
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
Subject: [PATCH 2/3] riscv: dts: spacemit: Define fixed regulators for Milk-V Jupiter
Date: Sat,  6 Dec 2025 14:44:54 +0100
Message-ID: <20251206134532.1741648-3-javierm@redhat.com>
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
X-Mimecast-MFC-PROC-ID: uxRfnmp0e2q3CYg1FnbafD7aOCi6DYUxRavPAbhPDus_1765028744
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Define the DC power input and the 4v power as fixed regulator supplies.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index aa425f02c1f4..5babed4d7094 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -20,6 +20,25 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
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
 
 &eth0 {
-- 
2.52.0

