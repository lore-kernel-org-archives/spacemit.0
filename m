Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5D036A02E
	for <spacemit@lists.linux.dev>; Mon, 11 May 2026 11:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497890; cv=none; b=LuqJnPs7tFOHxMoBi655HqvdeZ/h34rPG6O2iVHtnzLEsjiwILAflK/uGp1FB/khBRHianKmGkKigdJRqibNqer2clYflfY5GBz81CJt+7LHh1qAzsKKKpFFyBfT0udhy5RMU+WAmiDuu927HqXSlYzZf8bPEL+4F1MpLoERQ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497890; c=relaxed/simple;
	bh=So6dtc/mtLT18T7lCE47WhNd/bbpowldVBDhemYpOdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYQFs4bOpx/9SySEk4gBNrEp3B4HzyO9qCSf7AKNqUSIAenopVqg6RdO9qBGuiwMCB/VxbKSffaD4cE6KruoSCtRYeo+4hxyXCjFbOrkw/9U+NJzLtPLDEY2xVlQbqDWtr0fx5ndQeQvuQEqt0FqC3wj9AGU0qHFD2Vq6VwcpnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMZPgp6M; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMZPgp6M"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48374014a77so40176755e9.3
        for <spacemit@lists.linux.dev>; Mon, 11 May 2026 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497888; x=1779102688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgBb7+HyM/yF2DYP9WwoCarbZkeV4f+jLfQyPowzDrA=;
        b=DMZPgp6Mp4G23t/hLY65HmCgKq9QFuORnl9p9oUUaaDGEdPSpCuuTEj/ZtBauMQD6P
         Ope8D8AJ3V23gRQ4KQeFrWu0PAN3ZLqN3RSpUrFbw6VzGotBwGi0AUSV/bDmFEKtsqJQ
         AJ0hlFd3A83x+S2F0/oYYQpQ+VwoZhGqXw5/mkmzrgEp1hYMITTkK4eoXICjbDqVZaAP
         bbzunMntqOT7zer4UUohX6+xIkpKfkcgs+R0dQ+lmMXYzokaV70CUVxwI0SD7whED9DI
         MGM4uRGMH/4WGpQe+NLL6SxhlBA1GZzfAIGwYkcAn4bdahdmjW+3zUOji2xu2ly3TFcY
         G78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497888; x=1779102688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgBb7+HyM/yF2DYP9WwoCarbZkeV4f+jLfQyPowzDrA=;
        b=FL5YvKCBpVRiz+UOqyBM0bd2w2y2nzjXFEH3YpQa87vYszJ69PtRMqcMdqxh/G6mbq
         yA8s8lxGL2hUiozLYMtfLDv4OhGDMe9K3FvCD4yhKuFIyQkHg6zgDn3GNmWnc7AtIf84
         uUgkK96NvcJ8E3fIM42P+dAbFI+/gS9wOuJCiv3PG9dkAzRr6VokS02pra1nEv8qNNaR
         FmPDxg7U0n2kZQDse9c99urZXDgs3bM+qmg0M4wj1AJFUpHmA7y6plpuSlW1pqDR20Uc
         eKejkIDahDpAhJB4qsSLbArbNQi/6YLC6VU8Nv1ARJSjTiaC6K068pZ9Va1cNysWwGSZ
         FrcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/u23fcV2mD+MypzW/qkJ5YaEpaKZsOYF94/4EuWa0sL+hRSlOEwUKTZoNjFKmSvMlRqO9MycdGOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsPSTd3pWytbVZcEP/Z+oAB0nzzZB6sQr+GaG3/TrLmCfq+pdo
	pyOXnEY218Jtplv2wQqJ5I5i+ION9sSydYvnkp9qsooAfxeij15eyGYi
X-Gm-Gg: Acq92OGEUJqr6rtMhO1cM0ebr885XcEhcLkilviNCvPbmYlBZUUZCul3zJtA1ObizHN
	R75in8G6NBi/jH6xY31SasoMmxZrHnfgWkoUA2O8/9xgAx6hFMaYsVRTK5n310ALgIFONdw36+A
	Df9uphYqFqIYO4UuDSsLU7RQP2ceZyVnvHJ1ivLcWO8xBiHdnWwunJ2GKSFH0TTcwV9BU2xq/Ie
	aWV+e1zExAQSBHlKHYmTcg4x/Bvy2pu9v2wbcmw76F1ET0UmEhpHQ1iQ5jCDf8MY6jp7Dc22LZN
	S3k/QQ1uxfzMJ+v2Gj7x02oMmvBue5F9z6nEoKKlx9t5LFnMNw9P48aYkxXvcK9mXOb1DdJeWOH
	mz8cYglXPlf6AmwmcSZJ9zzYYNdnaEDlCOYHdPpnKM4ZvOeF9Goki+UfRuxznp/G5nhwBEPN0iC
	n/iUhsm1kycsfHzG/do9uHMKZaF+i2/6ztfe1AP+5oAPmF+TRQpfCPB+ZyMUvnsTpfVQ==
X-Received: by 2002:a05:600c:8287:b0:48a:52ee:5776 with SMTP id 5b1f17b1804b1-48e706c0827mr141592035e9.11.1778497887546;
        Mon, 11 May 2026 04:11:27 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:27 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] riscv: dts: spacemit: k1-musepi-pro: set default console baud rate
Date: Mon, 11 May 2026 13:11:13 +0200
Message-ID: <20260511111116.1109643-7-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow serial output with the same uboot/opensbi settings so the
console works without providing a cmdline.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 2d3e30f0bd806..c8bf776511c94 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -22,7 +22,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {
-- 
2.53.0

