Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945240;
	b=YjA58TP8ZfOgDL2Ssw5wI8SqvqQ/BWgrMb++2ZQijEkAgvT7S1j+02omsAfh94QrO3os
	 i+YBUlO5GPPeEcZLX+KXtcq6vMRlRqtD77zJkAjGZNFMEG+WBHyPy7rgOGri0KRAY8b6g
	 kl+8/hprFfQy9VHlNIZf65WduGRBO4dvSTcTUBx5yF1PEJHh/pibQ3lOTbVE3Ay/PEEOP
	 qcAaLuKCQKpBmeuGbhZmtwrAn9YH1if2wXRHipn15bIDvMU+G1j/+VSnbefjvvd5nhk4Y
	 GC/d0Qgo5yb5rCwIFaPoHgvUk4bDe6WUxWnRCxk8XQ6MjouPScJOFe/z/G+yuiA0jqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vsjSpshj4HQImP+U7D3TJsFl4xWtzao3mOwb3vIweuU=;
	b=ng2ylQAVAoDDx5WpWYuWpItmTBkRulgkuBSrmfD8Xc4OpuHx21BzeQtqoLCh1EbFnmkN
	 gFujwnK8qkN6i4qshU6kS11GuT3WvQftfAIH5lgkG22zWuTtTbySMBaarDO/9LSl5AZDd
	 W4pmrmfaSUVF/95wVegKqIvUwcILnvfqoBb4FPTBhkXBXBBbAfmgDJHeVPS0tnN7Hu63W
	 qz2M2IReLWxsl2+CbAi/9AlIGCfrNgjbhLOHJLuMEfjh3R6IKYEJqUEq4a8bALZS9PlYr
	 J+J0H2ySwHjhs5qaKBAS8IgRZzu/zUaEOpjNxLlbeof+JrMUmxZRMHxNGWadMXv3iog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INzN3+dS;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC8A606A331
	for <spacemit@lists.linux.dev>; Fri,  6 Nov 2026 06:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FC8A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=INzN3+dS
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1931ff67a29so1058390c88.1
        for <spacemit@lists.linux.dev>; Thu, 05 Nov 2026 22:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945240; x=1794550040; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsjSpshj4HQImP+U7D3TJsFl4xWtzao3mOwb3vIweuU=;
        b=INzN3+dS4WBTF84Uwl6e9y/fN1QbsSSpnEcGuuS5AyUvrPzr21aMSEytMf/CFh4MQg
         kD7I6NFiP9rJ3Lgt4qoGXytovk4MZqAXeVUkId53u03OKTu3Mo5j76JUK+JiasQrfDCP
         y2EpCc2XGZKf/nVQbJ/sBnzwEPxZ0tGStoVRm35217EiCHY7DiQJQm7rwFU7govObyqr
         9SaV4rdB8WFoT5Enp/PbnlcsHCv06Uca4hKX3XFXEZUWamPVu0N9Tx76zszn0IuzejU8
         DAXaU81uEVtXoERFzz9eKKlXw8LsEutpGAF3TmER1+dmxgYOZ19NrmYLV3zxqBwZUafk
         v5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945240; x=1794550040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vsjSpshj4HQImP+U7D3TJsFl4xWtzao3mOwb3vIweuU=;
        b=xMuo94ogbEglXTvmF4Fw21qfDXfl0C1Jjcbv5WKXT5gRQSnQH2naR9zelkvBACxcv8
         ErBri+EYCb+gChMnGEZNa27VruP2OPdXv3fn+HN7p+lX9cIsezrfSJKdIkvzhPrxGHFH
         7RHTfF7uiwp5hGj8BBTLhfW4VpvwykkleNLgOilWDlv6mrPloZqc+vYlGAsnIgpU+rEh
         jr2nE/sScOCoqoUgkMJqn+gz/lKDB5Zt0JUuJKZE6zVORLZkNNiMO74SulGotlSvHdq0
         A1f8r2sUJT4sHcdkhxAdsrNMx41WyOYiDxYpJkyqHNmkWBv1257WxCXD3gqPFe6J0z8n
         v+6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzOzjvfTD1uqp6j8dUMBRhDcNJGCfJfW5svDyznyIbCBUYn3Fnh0phU7ZI7wMFYmf9sMMEccnjfSA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/fTBkmzYVeSXNXKue4WwG//j2KPti4LWl7NDD34QOoiRMbVwFN
	gdXdFKrcp1ctcnMN211qOc2eNqPKt1Rth9Qicg6WlOON30CBoCcg676i
X-Gm-Gg: AYBFou1ZMKU2RzUR4NtIYGi8FXS/zHf+eY8OjxRcJf+GTR7FHEZ4wWKdt5fGqNRD7I7
	qfCZiBFUvqfwQgDIyXWivwCXqpmIorBq43UHQ2mEB7AA09LHUBiYFKWxtWaupnTFk55xFbfMYZa
	dwT32n0TNbKeHPG3K0z0DxZcGL9bHcIZBcTW629QjCwFFBPUYhaprZjX/C2t+qq5zzN2VTKcQpf
	FlkilpmxdA1nPOH/wMDMYxSVDIqPvRX0A6ePAuheQ7dYSWGptt0mFNDD5OKV819NFboxwgZgz/+
	lfGojiNCrfuaPXburAwI0EXyRMa7WMln6zApwih1oZXEJR5zuM2jjtRiU6+6iYV/CYjMsDjA/Fn
	eyoLS0888XOtEb0BiVP9PF3dOEZ7XXwMjqdW4B8+wJA7crK4rJd056aIdMzfY2KMizOIE8hOitH
	QRcKfVjHApFanqTnTLdJnkCZGCN2HnU//zxtcvYkXwJ88RWe2Y8oXkdNX6Cz0ZOK2hPOddhvCsR
	S/Oh6COo+4gUwUQvzDgHTmbumHdIeoU3Kp4y+NU1/xiW7YxRgA3MwewC4QrhNsEz7ZdTVBLeVsE
	5GZoVggKXAlXbA/Ea1Vn5Uhl0qZ9jvJSzAf5P/hcKjxEoXNKcl5l
X-Received: by 2002:a05:701b:2302:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b25d336486mr1698470c88.28.1793945239501;
        Thu, 05 Nov 2026 22:07:19 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:07:19 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Fri,  6 Nov 2026 14:05:25 +0800
Message-ID: <20261106060525.346873-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106060525.346873-1-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
fixed-layout cells for the temperature calibration parameters stored in
bank 0 and bank 7, using controller-relative offsets.

Leave the controller disabled for board-level enablement.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..51861fdc6a21 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1439,6 +1439,31 @@ saplic: interrupt-controller@e0804000 {
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
+		efuse: efuse@f0702800 {
+			compatible = "spacemit,k3-efuse";
+			reg = <0x0 0xf0702800 0x0 0x400>;
+			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+			status = "disabled";
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				soc_rtemp_trim1: temperature-trim@120 {
+					reg = <0x120 0x1>;
+					bits = <0 8>;
+				};
+
+				soc_rtemp_trim: temperature-trim@19a {
+					reg = <0x19a 0x2>;
+					bits = <4 8>;
+				};
+			};
+		};
+
 		mimsic: interrupt-controller@f1000000 {
 			compatible = "spacemit,k3-imsics", "riscv,imsics";
 			reg = <0x0 0xf1000000 0x0 0x10000>;
-- 
2.43.0

