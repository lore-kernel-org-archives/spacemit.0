Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F94D2676C4
	for <spacemit@lists.linux.dev>; Fri, 14 Feb 2025 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739546263; cv=none; b=MIiUytPl0ZPsJc7fZVAndc5cMVbAf4RKArixUERzl2FkpKuZsYk/o2Be16R97wAP8qvPp1sR4O0pa9y2J3r8774o0VdlVK9eDVIFAXYQ5sN7wPwtiXRMk2lFpjnV/Oga6YgYP5DsHRe/vOhax/su4MCfgZ7EphRzWmNR66ilN/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739546263; c=relaxed/simple;
	bh=JW1oohGJWsBc3d6n5iD7RAtqQIWyKDAHKpAXb1hkGTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=G/qA15G1ylkQap4yXHCEuWTHVtOVovhv0b2TNpk0xlJHimQsD2t8cERMYYlLVJFscxB4kwL7VKTgJXy+FyXGWftjT3KTZ4MsIALmA2XcqBGlHc7Hhv0oXybyCSzFvOQQJP5Pnz5WE/Opfg6FTRvfzpbNVVhZupCQewpiZGuSpUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bf2fCtXp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bf2fCtXp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739546261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0SshwRt8Gl3GApBo9RGajwM4sy4zKiOT3YLnoVCQViY=;
	b=bf2fCtXp8swBxWUagnZKBizkzQ8aFQTHp5JDIgzO42vuPhiS0Bgf5ShbeIEbOGPgFyNqWs
	XOYkBjWTI1OtycSoZ8d7chdMMZnfA5ttDgZ5mCWaLCPsczzbKzF8lL8YKQmWAR4J0ZxMXL
	UGEZAFvjYESI2pHB2KrDP4hT8Txx6go=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-dFzfZYFDOzGluRdy0JiZ4g-1; Fri, 14 Feb 2025 10:17:38 -0500
X-MC-Unique: dFzfZYFDOzGluRdy0JiZ4g-1
X-Mimecast-MFC-AGG-ID: dFzfZYFDOzGluRdy0JiZ4g_1739546257
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43933bdcce0so17421445e9.2
        for <spacemit@lists.linux.dev>; Fri, 14 Feb 2025 07:17:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739546257; x=1740151057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SshwRt8Gl3GApBo9RGajwM4sy4zKiOT3YLnoVCQViY=;
        b=KKraAG07zbaz4zuSdEv3C5tz1ClLl784IymWHZUMuOKgknDMM95TEQ8MDCRF5YP5VJ
         TV3emKeIWipcNLOQgGC1jvN+9odq9hpLMZTrgJKzV7/docIJuE8IQqNg9i82/QVWoBh8
         gXkqBQsTTcoLdjAPaOr7p8xYP6QjfTQ+xON/H+qB8xBReT+6ENo0qvZ/FOSiEbKGOPQe
         tZA8fv7LCxjL4XrUPUSY/K5MH2dJWywdpAUWlYi8DQp5lyT7SdrzqJ8r5UnUURRnAahR
         G12kfFo6WkvNVCcpG3W0e9VBPuQ7qpenaXdYktJEY1N3T9DKP4ruO9tl+Etx0ju2Y7lC
         dLaA==
X-Forwarded-Encrypted: i=1; AJvYcCU/0EqjmGr79TAWKP+MnaKFR1zUtKkIFild41ZnGksLi0Tp5JdR26Dp32rcAdJy7ZdUE5aLxQl0UA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyJ5WZzZ4Q0YOjoiSrORmb/o+6gyh2zkThGKI75mzBoivf9huA
	fqvF1AzI2DaogEotap4bxWEnqIrq4ctAhXVEq0NFSjrqRk6bHIUGR8ZXA/P9qxUFYS1IoYjKeAM
	Xx/68N0ytuop2sTnPbaphyJOBszapo7yaKLmGXusg7xmUP5LSho0iYJRh
X-Gm-Gg: ASbGncv7TNkFiXQT91jCTE0+hHzXEghBnaZSzsdbS7a+BE9rklHH4ln0O6Fohjf+VvQ
	GwqYX06YcoPW9zDkkX4oPyPfkmYaeoV54rvWyxPntjnKkPbBOWPUIyQcD5298cKbHqGbvewlO1o
	KT6+na+LHDC7nlpcgvfXq1Vj++zMpGY1LEkYD+BzY5rx+TamYODN9UBo0C13DvM3PmiKtyvImHC
	+uFaVGGSWL2qp5jj0mkI4puOlYmEHQxx3CyNw33BwwMHSANYyfbo6WugB0Ccph8Tc9ZkiUTbm+u
	3diPQTe3zH0yM2wgxAVY6XFgAodoiw==
X-Received: by 2002:a05:600c:3542:b0:439:6e12:fdb4 with SMTP id 5b1f17b1804b1-4396e13034cmr4345e9.14.1739546256893;
        Fri, 14 Feb 2025 07:17:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3/3JFKYy9eGyD7IGPX1BVb9PSRrb5ZVdMvOU2CUr5TK3oN3GiUFe6oGPOq5SoYQYtuJNygg==
X-Received: by 2002:a05:600c:3542:b0:439:6e12:fdb4 with SMTP id 5b1f17b1804b1-4396e13034cmr3705e9.14.1739546256365;
        Fri, 14 Feb 2025 07:17:36 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5ef9sm4841762f8f.76.2025.02.14.07.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 07:17:35 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: javier@dowhile0.org,
	rjones@redhat.com,
	abologna@redhat.com,
	spacemit@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: dts: spacemit: Add Milk-V Jupiter board device tree
Date: Fri, 14 Feb 2025 16:16:38 +0100
Message-ID: <20250214151700.666544-3-javierm@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214151700.666544-1-javierm@redhat.com>
References: <20250214151700.666544-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: URKVgvRqbP2MNQrkH2T4fAGMKpPcpJ9djtRTmG1xRWo_1739546257
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add initial support for the Milk-V Jupiter board [1], which is a Mini ITX
computer based on the SpacemiT K1/M1 Octa-Core X60 64-bit RISC-V SoC [2].

There are two variant for this board, one using the K1 chip and another
using the M1 chip. The main difference is that the M1 can run at a higher
frequency than the K1, thanks to its packaging.

For now, only a DTS for the K1 variant is added since there isn't support
yet for the X60 cores operating performance and thermal trip points.

The support is minimal, but at least allows to boot into a serial console.

Link: https://milkv.io/jupiter [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 arch/riscv/boot/dts/spacemit/Makefile         |  1 +
 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index ac617319a574..92e13ce1c16d 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
new file mode 100644
index 000000000000..448319214104
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ * Copyright (C) 2025 Javier Martinez Canillas <javierm@redhat.com>
+ */
+
+#include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
+
+/ {
+	model = "Milk-V Jupiter (K1)";
+	compatible = "milkv,jupiter", "spacemit,k1";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
+	status = "okay";
+};
-- 
2.48.1

