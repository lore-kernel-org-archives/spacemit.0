Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243AA5CDF1
	for <spacemit@lists.linux.dev>; Mon, 16 Mar 2026 01:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773622876; cv=none; b=Kt4QHjhvlA4oAGCqOnYVOFeeC5nOYF/p5qYfA3JBaaez44gFjGc964hioLiJrnjA4JeV1AqdVRmYewn0z6zFWXpkR0sLSZARLjyvIhkR7dmQfSksa/28VsvKSs2ncHSPDAE1FO5fzlUYDnV/rQJTVv1yXBKNI2Y1Vn45XJXJeNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773622876; c=relaxed/simple;
	bh=3McREo9Kk2UYPLjGgyLNM8Spss7Ow8fhuceAlqV3l6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QwAb/hmfhGEHBaIiDp9m8z9iuRDWzZPY1JdblSUjE4dJHPy1pwSFuXZohN3erwFfa5mkskHwbeuJhVD9Z/g+4D4+64SAFZzWVqg2M3NQRJyXipWdybQsxa8We2gxoRKQhOga/EoAM0PIUwNvRh6mn89IxbQsbqS1SJEgfBSJrew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLurGmKl; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLurGmKl"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82987437624so2085598b3a.1
        for <spacemit@lists.linux.dev>; Sun, 15 Mar 2026 18:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773622872; x=1774227672; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=MLurGmKl3giha8YKte96pWXDaekS9U+OlU2qj3nThmm69A0HGOfIh8PKsr6T9xViWV
         zzMz2kVk7EsuD0as8yUC/SQuqu+cVr/GDNd5gj3KrAFkABq5oXwZ1HNOO5s8jsNrOdAB
         +5igzMu7OlXS4q//MuV2xo85pxhshbWUL7UGgEFvB99L5xRnCDkLjE8/mo6u3tMpFcAA
         YiUUfilJGjaJUcl+58JM6nZUUL1VU4yaOwf+bywXTnXlwvi5w8L5m6cQ7i68fYPabD2T
         P4a66bGy1efBLu3IDTzs5UhoMnV4o2O+SUzrVQCYUanFP/DNDx5oA/pqyMPepKi31f2x
         9X7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622872; x=1774227672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=nxT7jUo9oemEBSV5cia1yswDPgaGSNJARdfH/UrZyM6kv5T8oeAdz0f+wrw/QdaBu/
         XROJ7uyMdSmVwbd3Z4BJIttmhWEO3BV0U3x2weAqh0mb+QB3RT2JfDYlLy1f4vZfFDEC
         0hQDvPabB5bGcDQQNrt6OG4mglOAP6JQahMCigdtUzb4g2c3Cegg1SNqZeJ4GIsFqpGG
         UwTS2ff3RgVOyTxpEV2mfdQLlXEvPwlyDRaBmi8mKa1e0kqP4SRJYmb0KgfRdrKiDBAu
         TyhHoeT77ykBoVkfWfnb1Q22iq7FCjSMRmkmUQgyxCiNPhZZEbtQJZ+p0tS33zv0APsq
         0oBg==
X-Forwarded-Encrypted: i=1; AJvYcCXXnuXeAQFdH/VFZFalq5ybbu4i5nOD1EqWQZ6hAKB+hE3vK+w8/JDCNxzboKZgINr08906GbHBMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUTCLIaAoG/lAij/lpaxCETwq7+BtpHG4xlGFhcZqgBx8GovNV
	4WfYGt8yCREP3iWLid9wYTwql47atmb8tcWdUPD3Gp7s7idcekz60U15
X-Gm-Gg: ATEYQzw7DzSxfrg3lZJ8dXFOLTILaKwRs2mMwMNfxDX7nZXT5kgV5pvh23vezao0oy4
	z6zH+Mz1/i+5Eo0wAhOJ5ar0KqM0t53B5aHqa5LY+1BbtrI5sOp8AQvnMzOKmB1FI5teQI3a8Wi
	7qSfQFC/go2zIkxxUWLyExQp/ku62gH2RyBb9L3JLFM/u2o/YR+i7NAjO1IJ6tieoFVhhD+HrHG
	pYQ0EG4ZWTtouOtn7LqOxLh0e1yy87po0B9CmYDRbfUaLtUX9S1pRvQLGjqsigglNURe25yDwQ3
	+KlUgDsVWtq46p80wfb2pD69oCLJ0FmY3sJbe1nlrKagsDYw8ow4luo4eWp7eieGgCNLulccoRk
	2IIATTDHGotwI8CBsgxQFlx766vRgWYBP6sbLRQZCKLBwMvYm3wDUw7xs6JqOgqx78mNvZZ3oYJ
	6kcB4wc1Pvye2M6I6EqracSRH+sBSdlrAXSg==
X-Received: by 2002:a05:6a00:929f:b0:81c:ce40:b29b with SMTP id d2e1a72fcca58-82a193e89a5mr9456189b3a.15.1773622872449;
        Sun, 15 Mar 2026 18:01:12 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072419efsm12308166b3a.11.2026.03.15.18.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v10 4/4] MAINTAINERS: add entry for SpacemiT DWMAC glue layer
Date: Mon, 16 Mar 2026 09:00:40 +0800
Message-ID: <20260316010041.164360-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316010041.164360-1-inochiama@gmail.com>
References: <20260316010041.164360-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the SpacemiT DWMAC glue layer driver and
its DT binding.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2265e2c9bfbe..dd72d26ac837 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24834,6 +24834,12 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
+SPACEMIT DWMAC GLUE LAYER
+M:	Inochi Amaoto <inochiama@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+
 SPACEMIT K1 I2C DRIVER
 M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
 S:	Maintained
-- 
2.53.0

