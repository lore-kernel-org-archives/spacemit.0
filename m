Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815721;
	b=crR4p4teSHfxsuxyLBYdps4Kyjve54Tk5T4/EoByVdswi1Odp5PM9T+yzx864P9N+0JQ
	 R1HRmexMGtX4Ivc1Ucmtf04Ubzguym8kfnuKGygZYiFlp+tspghfuHrvehr26xZ5N6hf3
	 P/t0PDxx5IP9Yw9JHVOdROhGl1ePVvlS3tLKYHxEHjNbWdesv3TxLvqw9X063kMEFxbvO
	 sQqrrInRwB5chCWxN7VHpkzxnAjrMaVzV01CILQxKikjzyII52C1zoTrMcZUFDK+PYASk
	 1PMe7T3TbrYzmEg1tbsvFc4B2kvBXaCE+fAnpkrPHCvCX+/5Fi9q/7RFMfZkAu0NKQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pssg71LWdCQxl/L7C/4N5Wwh5nUrjx9m06X46tmlYrA=;
	b=k4FcpwSLA1SJUpVWFg80aTXTwiO0WZWvN11CuNXy6/RCv+dmeBpX9Q18OsTqWCFeWJR/
	 42Y+lvN6mYGFeEmG3BJ18AgeYdxbt8M8KBld9aZmvivpr9ADaLXsJRU0eRfWummHIysFx
	 AARe7l1geyQNM1BqZdAkkXH/8JwhRTM8xNxUHETgO3rNhh9CCg5I3Ju6VkauTA4zsLwXx
	 tqoAwDKgSabHXvTBbAJbfCB0rFeS/+K73PIOfbhgTpxzwmrwODANma5xWtdVJ9xBhP6hV
	 PTdvAffijjgq9JixfNfpS33jd3SWprGH63rRTgxpWUYEXdLaUbYpgTFksCTsC448WkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wsRNIGlf;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BC8606A329
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 07:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3BC8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wsRNIGlf
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36dbde64409so4596350eec.0
        for <spacemit@lists.linux.dev>; Sun, 15 Nov 2026 23:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815720; x=1795420520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pssg71LWdCQxl/L7C/4N5Wwh5nUrjx9m06X46tmlYrA=;
        b=wsRNIGlfNQNj0cfN+BLMJtk+cmfoiu9TqPBliHS4MO4hLCiPi8tML16fguPy28GgF4
         idc5aEcob0cwbE/hyKdkgO1NC+yXOqPUwr9KouTWX53WmFSHXF5g/wufnaYbFXUlPhHw
         b/7yn282thFhmnjDDcXE4YK4KSEVGrxoOosId1sUwE+p2vKDIgtM4XLj26TCeOk8KTSP
         Eu4wmxYzf4cU7GFVUFVqqfREADhGOXRCGYbsvMR3dS3v3lF7aulH6b09jvGs/7dN8epv
         rLJjvdCcgFSZbFCVXoH3Aou09egBbJWxGy7AgCbnuQx6cL1UPBEwr0B4je+EhJfsJzfm
         7uTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815720; x=1795420520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pssg71LWdCQxl/L7C/4N5Wwh5nUrjx9m06X46tmlYrA=;
        b=ZEsIBOfgHK0pELcRG6gFXw4/nDa1KTDBByjWxvoppwf2XpMHffbUUP0VN6mMANpdC/
         5bj8arDckaQRVt4bxma8FXIMWK+G6bUdkw/QxXKb/iXixHHSE9YjC74EWx8rQIS2pTp3
         BvJvX2XVmV/HOSVl5wjpMZVo06l2sksRNa0vo2nHXGqEyN2XjT1tXbvDRZZxm0wHMAi+
         5Us0fcATr+jhnXD1mJOC7IYl6K0renBdK8XX7Z9mkaaQXppDEcM0wogrZby/E73312QO
         VDigpQZ8Wzv+plfcN+Os7NsQeRaFkQoQq5CMoPMJ2ekwnFkfIHhex7TLjktWMMwPmTL3
         a+xw==
X-Forwarded-Encrypted: i=1; AL+hErG2YEZVF5Paab7g0J8hcPPbyI1ghtnOTJhtpRCFY2YtiR5FvYNI2+5AJpxRHrtvtWdqw4Kn+IBWFA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/DdIXXlPSgPzzVqhZQjOtcF5hPQNybwAOIo3LfFbwlgk29J3RM
	LY4P6ocpgHto1iki1Olb8fAULB1GT3z89hbD4owQmNa4YwgtDSQmjp2k
X-Gm-Gg: AYBFou1Mt0JvLvmasTTNJ2P6DokGJl290tREZ5lpJqiewWVEtEDuCNnI7ZewmmHhheI
	0q5xGK3Hnfj+QlywkqEqwtvJ+rdJgotePYTZ/bKXhGNkWAnTkYb/Pgj2BrtBYoVT6e2k5hZj8Y9
	S+t966dR6jnekQyNJe6wbTTiEAPFFR33tEK016g+b9ZjDYTWe66EhsCc0BU77tkljpL3b1wCQk2
	X0GMwYiVLwFt3iWBLmuycEuBCqGYYcHB/z2+NZVC12z9sZN3tB61q7jiMBzVPDmsAH3kZKhtIxC
	gpqJLm9BH9I3CwkXEDVXUH+gf1v38660LSpmwFidub+0dkZiM9VPD3DGbpnkFJ56NKd06MzCeL9
	115O+Y7EpVoQKVChVeKxuLp25gkUgTxm+dli4fqJehw5+57uA7OrJnr0KHoVl/we6Ck/Uk00iC7
	WcMoqunyBYZQtFBp5/mZnnLqudu7Ad1dW9FvUcrI2hztztso5bOKw9v7WF0fYVdW8osdnA584Pt
	CiiMcL/jwtzn6yunN6LDxTTgLixqofVUYLV9iGYwafEMOZIUd9QpDacLEbcUnFKqWO9YYDFxtEm
	+gQUaCp72xjObn6fNYVu3X0rZmuCNAa5G6oSh+3u962r0KJGO2d2
X-Received: by 2002:a05:7300:cc83:b0:37f:79f1:1a1b with SMTP id 5a478bee46e88-37f79f11a78mr2072488eec.22.1794815720090;
        Sun, 15 Nov 2026 23:55:20 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:19 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
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
Subject: [PATCH v2 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Mon, 16 Nov 2026 15:54:23 +0800
Message-ID: <20261116075423.1519438-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116075423.1519438-1-duge1256@gmail.com>
References: <20261116075423.1519438-1-duge1256@gmail.com>
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

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..b548f5029d59 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
+		efuse: efuse@f0702800 {
+			compatible = "spacemit,k3-efuse";
+			reg = <0x0 0xf0702800 0x0 0x400>;
+			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
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

