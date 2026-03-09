Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4353A962E
	for <spacemit@lists.linux.dev>; Mon,  9 Mar 2026 11:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773056444; cv=none; b=nRnrgnyV2zZqf8a2342a61hSYRqB68CB0cwuXuwiGHpU/LqIQQPHKTdvLsGxfUHGzeP5h5mwepUZcotkPzP3hQDm1X64zY4uvdl3EYEwRxJQ113J3xBzNFPZaxZL4uKN3sRVplwFUEslDlM5kuWlw3RrpPTtKNSew6K97ew5OSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773056444; c=relaxed/simple;
	bh=JfN8DfHHQxhwjIM1D93NxIpzHPkcFqd9tyZUtqUCLT8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=metfAzJGmjXgpZfYfXPXaSC+Py7/45Xge+cia8Bo0DBcBeoxLMgBT1vVQxMCIwk8nEaj55V66+PUATtS9zkhX+ITJYpUdCT8oJs76xA5XV7JVVxyjKxbLJrlHR+o8KS8joKOJAuacwLvhSwBeb5U4BLcA/f+ypjmc6rlV9JlFoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zsm4G2te; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zsm4G2te"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439cb5af25bso1894463f8f.1
        for <spacemit@lists.linux.dev>; Mon, 09 Mar 2026 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056441; x=1773661241; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njsRP4EImn90P32g9UPmNNWBlL1/zM1gb0xUIcz/r+Q=;
        b=Zsm4G2tezqp7oLFbY8IDSS4goEaQTL4FBouSlwXXyVIU+RFjJfqyQd650Q6cqU+3W8
         eiDmWCfE4TwNF+B6UcLioMlGiaVSuy50Q7zTsXcbcmNT1BD15sPTpaWqVYrgqxw8UqIt
         UyhqNmURIeQilS3KF7j1MOJfOph7mM8BhxcHFHmw39K2ndB5tqhlIT2nSoy2Mskvavqp
         saxmu/Bcq4Xa66Kq02mJvaH7hrriKrod3Dz2Qajnqvfr/C5m9MUrVKUk/saTPNnq/irJ
         QDH4jOg/P5r0Xd5KzyLIDpx7YwRoJSc/JXByYfKKREqOXEZrZy1fJ9T6X3YUDs7FKrnY
         FDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056441; x=1773661241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=njsRP4EImn90P32g9UPmNNWBlL1/zM1gb0xUIcz/r+Q=;
        b=bWikPukWgwt0HkVCJXnK49jevC+2chrOr7MwbTbSoqVmDKunVPPv71nybsgP3G7iFL
         0N1ySe4MJ+iohedNLD6Kc+aiTE2YCiN/wbVtWAn9WiKc9fLWSPUta9V3KFALwAzb3/aB
         jNk4tAcytdqT+FZxYV3anHu+zgL/tA3QY+2KBnG80YEjtw8xPp/BsS0SDqXP9TQo+7/Y
         ctqmfJ5vIzp6O10JHgipRO03NAxGL1pHqlNEj1owq50YPDHPziDFbBNmsHESO6pRjEaZ
         klBx2evCJ1o2jcnc/sLcx5hr+8cn66LI1HGGybCecur5SNGsLRimuvxu4bIjfs+nFV6L
         olkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsleNBEoCW1wpuVuGWeWk6GLFHJCnOy9Qbxah98lUC20TZwUavAnqAy6z/sA7CWve4eAURiiRL4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxaMsSHXH5C7IChQABRXlp/V6NbUIa60B2hXh8ebLGIND1oatv
	QTGHxr29azr0NkCEwfjMOjDeS72GdhqdChS2UeQTYgRhElrnWs3RDOxl
X-Gm-Gg: ATEYQzziShr2sjG2a/9agz5RRMRIRFWbFp2ZWZOwISlccl5kyc6cY6pHzEdkTMhDNfv
	5WGVVXv3o/w5EiFPXD5k2ZOJOMcbf62q0pK5dy3RHLyEATSZQJ7qO0To94DPBn4iVjGE/zgQLCG
	SMkJx23+psvtlAP2aT/2NxmeLufFyHjFb2ktUEykqdKJLkkRtizpcyw9/iwZVeW8QtViR66Xv+4
	9p4d5XTPPAlO9a+rqRm1stpTm8pP7UnBHPKesDlF96Ce4deNcAkkuJ7yuKD9k7NjbEKiCF4fdkj
	OxkF63yHZQN46h0PabCHM0vw+egQ8dUxGDaU1RdUPJwrX/jrNMKmiOzS/jE0Op+VP0KBpKrTptU
	bmdmefO66332nx/M5xUnwUdKOz0ArHfmlhWBaPRqD/l+EfhYl8jUMMeGCXW50ZjHMadM7Flk6XU
	DXRpsmW8d8frCNFvxZ0oWQZfg97vxNrWzzZNvFlYeC5/2rayE7V4foBeefbowEdB2L
X-Received: by 2002:a05:6000:61e:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-439da67bf28mr20283499f8f.34.1773056441001;
        Mon, 09 Mar 2026 04:40:41 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:40 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:17 +0100
Subject: [PATCH v2 7/7] riscv: dts: spacemit: k1-orangepi-rv2: add SD card
 support with UHS modes
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-orangepi-sd-card-uhs-v2-7-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2

Add complete SD card controller support with UHS high-speed modes.

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

This enables full SD card functionality including high-speed UHS modes
for improved performance.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 414b03f5e6480f05f5d7eeaaa0afb4e86425ae36..361135269801f436703b6f1d768c91325a52f07f 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -140,3 +140,22 @@ sd_vqmmc: aldo1 {
 		};
 	};
 };
+
+&sdhci0 {
+	pinctrl-names = "default", "state_uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&sd_vmmc>;
+	vqmmc-supply = <&sd_vqmmc>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0

