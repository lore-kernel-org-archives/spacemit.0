Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFEB3A6B65
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 06:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665241; cv=none; b=m1Yx4gD+OX2dhuOLunhxPNYNvegc+LY2z7QaUyas7DcP1NeGnhtMORcJcYBoCQgrIrXdOa825HfIggBfJg7VQW7XSnJTEllBp4H3OSIz3B0dKqY46CioNifl10RVNm3VHI1YR3BuB1/XdRYJ/5rIjFmQWTeDfG8iF+WZQH3WsJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665241; c=relaxed/simple;
	bh=dbwF3XOwIkmwKWyPcfA1lqI8eP024y8lcreua3BESFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DL2k4YqLYTBvABSG8QLZdlkzqtjE2q1scHeteoOYmWCHg6GeGAGn9OhboJU0LkdCCOz42QlGQp3GYEq2kfuzXRA+5NesbqVhLaK0gkAAWTzQYsfhf/UzZvNud3UPxWx/JzQAJ24pBD7cZ0FFPlWu5+GpZlqYyMV8+7dwCsJaWvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5Ozr6Ua; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5Ozr6Ua"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84847482584so419486b3a.0
        for <spacemit@lists.linux.dev>; Thu, 09 Jul 2026 23:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783665240; x=1784270040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVhq88axF1qV0hsa5snykJF0ozONqTGS7mDXfQTF8KU=;
        b=Y5Ozr6UaN9bLFUn1PUm3wOPG3SmzXqsk47C1jwZ4BQ1lUjvZxsIbyMU56DN0laFrp9
         nzt9WUK3w7iqDZn8yen4DqjPAV/nar2Zcngy6Yq4yio7XZgXZGFS3gA067dBwr8CcBdk
         oIrotSsZCf7+z3uVnA+MVHLHLPDwbySQ4H4H7hRfprDeM4RWG9pokuBJloUw7XqpP470
         zItVDzLAHfaEpIDGIFVch43Nyl3DUvBPLeldSm4iaV2vhuq0VDaN67QP9kqK5LzcLfR2
         ZV9hj2OJoieeJTEj0VrkdlBmNk/AZ7ja3Z9qmUZSGTqJNGresnXbmbCkXAN0VL+iRH+J
         shig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665240; x=1784270040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hVhq88axF1qV0hsa5snykJF0ozONqTGS7mDXfQTF8KU=;
        b=Bqx3rYxbaBjZ6zCMPBz/lYyxsuYaUGjg19P24ZFyswrN5c+AX6r96i9Sak4YV5JVw3
         8m3lPhm0BaqTs9HHt8dUvQzy/xGFPJwmZEEVT2Cfkm1+E/RJigEG0yiZb9OOdi4KS/dF
         wmPceWmtqKZF7c0DiZmU9A8hC1UGNv0h6zpLhK0or1vKs4c4O88yJdJmoWAU/YXbYSF3
         ses7GRAwliv6tSi/Mbnxj/7sW2Z9X5JWMbmfgXgEyjTaQMpkVp4/uP2z22U0RxuRYDhr
         hQXF+384BGkEmq/jGwnRI/yzCgqRIi7tgWDl3GDU8ofqG0BhXO4BfBAThhU+ScnfdjEF
         WtJw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+snvsE5rUg72mTnvq9RQwdhSuom2OBWi1BSQ3+Dt6ALbl20CjwWE7ArzOZZU4ajB+aPIiw3ZzCg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxv0N6yR21K8+SJ3jdEDILMohVkeBp1iHyZY/r4ylYrfv4yA0c
	s/3+dgOhEnoGvpFxZuIjRjcykkSnPRUOFphHPASBTGsQbNMciiIPEWEX
X-Gm-Gg: AfdE7clD7pgYYjSrFWLeVmuowg2QNdR5y7tbVA2RHdV2mzPsXyqp+guY2ZbSyLuAj2e
	A8nZJ/6WX/vwFEsCfYaYp6EK0vpmFcQvkIi329yTT/z35NHuo5ziU3j4jQunDlS1h9fBDU0Epk5
	2PKMcK4eSIcGDJalO7GLQjprTguVbKLTKWpPU43WrJNwIUcOhbMU0g76kM2Kd4LjXL3YGNa5pmc
	A/jSxkpPSTAduBvBWuxLk0ZPdKhqno0UJ9ablmmKS5t4dxM8SEf/Xo6MygShI7YrET6Z5O6XC5U
	NCpCyfFHczUK0VNv0bGSopSArO/JR2loLhAFTPhvNho5htcWQBSluQHkG1ndAwwwFTves1vhIKB
	+cBeJxOQ+AG8E6bKMpTMSO7W7bs+SQo14ygX3BC1sskb8oZnF/nMuf02cfMckISruWO90VF3tep
	4hUNJZXMz3fmo=
X-Received: by 2002:a05:6a00:850:b0:848:2ef5:50dc with SMTP id d2e1a72fcca58-84870ba9000mr2044134b3a.36.1783665239872;
        Thu, 09 Jul 2026 23:33:59 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8480da8bab0sm8174681b3a.8.2026.07.09.23.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 23:33:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: spacemit: Add enough deassert time for the PHY on com260 board
Date: Fri, 10 Jul 2026 14:33:13 +0800
Message-ID: <20260710063314.1030249-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260710063314.1030249-1-inochiama@gmail.com>
References: <20260710063314.1030249-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RTL8211F require at least 50ms deassert to guarantee the register
access, 10ms is only enough for the PHY reset.

Fixes: cfe5c91cb73c ("riscv: dts: spacemit: k3: Initial support for CoM260-IFX board")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index a38d7b738258..b704b537385c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -178,7 +178,7 @@ phy1: phy@1 {
 			reg = <1>;
 			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <10000>;
+			reset-deassert-us = <50000>;
 		};
 	};
 };
-- 
2.55.0

