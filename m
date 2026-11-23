Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408928;
	b=vVd5jQTVDlBHNqYtdRY2g50z7TXj6o6dCLcm9sRsr2hHqdLFhEkzucgRl/FvDw07NB9j
	 20hssydwrDoMvlm40vT4PIrSoGqO2lJR8m8+4e9Y2A+Qve34wfCYbK+VRhYVkiFZXNP0+
	 xO10DwPw2E1Qc2FIoRu5/ky1tN9+x9tzejWkk+x8C5CKLMogHQ7DSOLKjiSVqhG6Xcqzm
	 +Y+CfwMTdGQXbv3pN78yVw7dl6Ab/wGTNRayWkVswEI9WK+u9QvO8XLRsM6Dzli/dMtEJ
	 sXRBu5RZfwAZiR33rPCnzq+TrAhkLg8kPXI9qqBSKDFmlpzUtaUl4KDTCyM4NzjdYNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Change-ID:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=YVCntaXptXzPXs2dujESh2ZwQdzejioJ9nbTZWK/igU=;
	b=afudw1xcyDYiOU0YaDLoA4G9I80YTTKnTk+Tb/P3NUfYbPnhKmvU/azBQmO+yt4EFS9i
	 b96NFSufHWCYu/L+xUxlUkda+ptkrpVYxtwy4WnJWQPGDb6AOLRX0v1JPGzj5ACuJzQ/s
	 XUDWpaiHVMkPpttGS1ugb9vLIvKjuOaFi/h7mpYOZr8rqW0Kq+mjg1ZgMunt4keTZ4MyI
	 G6Wzry1Ees9BUrQx5hI0zwO3mZgCY6cQQojaoKXhq+cXXCediFeuf6dbqmqaPdAqBrS2+
	 g5kFFdvKoDEpPWtI603VUbY059PcBrqUPMum493hlnPPUEheJ7pLMHc5TPkcc6gscKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qL5hRL0m;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED08606A31A
	for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 04:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED08606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qL5hRL0m
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-385c497bf94so1230270eec.1
        for <spacemit@lists.linux.dev>; Sun, 22 Nov 2026 20:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408927; x=1796013727; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVCntaXptXzPXs2dujESh2ZwQdzejioJ9nbTZWK/igU=;
        b=qL5hRL0m+lAznAW7JctRPsdJkkOlWs/Una0Dp4RsQQzvyxduWU1ooJUwi6JOE1+RpV
         GRHZoyxjgbzhnO2EP3V7xUEDSAiNuTvYDcY0tUV509ryTXq5FDvLmcPINuNChSTE5Wby
         ZC2+NGhk5cqIYpUO9M3iZFowR3wosXanK7jvZ9QODv8/Jpqc8HvJPJjKxVm34XHbE6ho
         1RiTVGHja/JMzlF4oOGcygEv8ejD228yFIV6lpuY39KrBiQ7Q2FELgfLLVJY3gmhdrPo
         mPRFz7O/BkXl0WU1kLXJ4JyZVMcwEz1bRKAC3rm2BOzka4a54PYPPO37X4e6TxSh87+X
         peog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408927; x=1796013727;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVCntaXptXzPXs2dujESh2ZwQdzejioJ9nbTZWK/igU=;
        b=KewDvCJu88TdTUMv6b+s+33CkAM2pC6/8XPSgVKYDzhBpALHARN6teUpPEzahZFjRL
         LbfC6nsD6GlMUlqZRwaWZDRxhcgF4wSbHR3yh5U7tZrUE5ZJ5oyAi9M3O16vbIHYmhwr
         FDoh/NJJqJzbQGNfQvwg27dQtL3w1kXP10uSDwcu+eAnmbbyG2nbN9TOT9empakvMCiM
         HzBND8wbDe71Ze9w/buV+f/Y8KBYJrAE4OICh7Idv+NqD20rP2baMnqWJr7Zi3O6A3yY
         KhqZLpH0lwAJopXZTqtTkVPqPZ2QyuPYNJWS+/Os9lbPPNNy6S+nZiv9AgeJOGhLM4NF
         G+9A==
X-Forwarded-Encrypted: i=1; AL+hErHbr1BAFjwJt08v6btqy/NA601ggLk6gRMJXFZrqyyRLMwYUfFiB9QrrjX7V6Mjb9nTlsIj7+CVgw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Mry54scL41ujCRJA+Za2YY/pjcqBBLO1mK6H2eByBwJg+HhTq
	F+mtXvUe3jCKUB9gN+25vhXUWn/jjCf8IKoGaBDaSbePgIaGy80npT2k
X-Gm-Gg: AZFdTZeaV/18hGk9BPKHag/myzqSF0+aFElh8sdVWZGaCcMzAxdu+aeOu8ZvSIRI5xV
	p7y64xDjAg8ZAtiKIuR9EofvaRJ25od6UhnaSZ0kNUmAnH7yLqoSEqcmN/eK/rovR79cYcZ1/q2
	PAIDbb+7RlYwtN7QwFJj1gmG0uIOX/6AkrL80Yav7BW2u7Z+gI8CW8zXAxxR03FRPkg9s7OOzrL
	OHXv5t8UJBuwnuT+b/UQ2pEymWfBD885YpH0B1uNlJ60cK+i+wFVWRS7qwvrqzj26mnNwx7I5Ui
	8PuPn+Mnygs5F7qrlH3Eb7ZZznkisCrH66dHcIlvWyD0+zGiw4AiqExhIi4pggD6e0fztal1T44
	Hly1EDa6vIZATM89EQvNC2lkAcZaX6k5iQP9icQ36Q+ebeQUonjRzNG0h2W4B4M8t+3oiuA4Km8
	FgEyLDXw6IdRU56CO2zxPHEiDKw1Uw4ikAoW7/uBcKOT22bZGhhtq5o4HKc4W6qgghqwYMOG1z+
	J9UTSl1cku3Ir/jjkG4BrJDuJD4F3CoK0COMR9T/nskNNeQJlEZvQ6pjXQO+4uYgDSsmsMwGsG+
	RtJaholprOU40zs+V4MeDBeC1pAcH2zSxl3iXVJLoeab4g==
X-Received: by 2002:a05:7300:2728:b0:383:c2f0:e753 with SMTP id 5a478bee46e88-3856c0d0a68mr12512979eec.3.1795408926522;
        Sun, 22 Nov 2026 20:42:06 -0800 (PST)
Received: from morise.tail.syca.top ([20.89.104.82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm28404929eec.2.2026.11.22.20.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:42:06 -0800 (PST)
From: Zixian Zeng <sycamoremoon376@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Zixian Zeng <sycamoremoon376@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
Date: Mon, 23 Nov 2026 12:41:58 +0800
Message-ID: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20261122-fix-bpf3-eeprom-51ba6e0f110a
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795399932; l=3631; i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id; bh=ZpyjTSTFUIhS0d4tphn4fxfvTbp3zPacKqQQgrGQ+so=; b=RvNnAQ77qPUL5wCgqMI0kl7NMSKeS+xd2E3WmHM8XdDNor4jB0xPQE80VkQtY8z2Q6PBXTRUT 1YOHKj+G7HsB/mXpwQGVEf7btPUIUdiskkCZ3EEir7npCKQCDgS9U+z
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519; pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
Content-Transfer-Encoding: 8bit

The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
256 bytes with an 8-byte write page, which can be found in schematic[2].
The device tree declares pagesize = <16>, which does not match the
eeprom chip datasheet which declares pagesize 8 bytes.
EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
together, based on the chip model shown in the schematic diagram.

The TLV EEPROM on this board holds the base MAC address and the MAC count,
so a corrupted write leaves both Ethernet ports without a MAC address,
which is how this was found.

Link: https://www.giantec-semi.com/uploads/20230414/GT24C02B.pdf [1]
Link: https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view?usp=sharing [2]
Link: https://pan.baidu.com/s/13UTY_qM4gGuVxsZ9U7_Xpw?pwd=8888 [3]
Link: https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR?usp=sharing [4]
Fixes: bfce75e2345f ("riscv: dts: spacemit: add 24c02 eeprom on BPI-F3")
Fixes: 46a8c01700ac ("riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board")
Fixes: ac436e6879f5 ("riscv: dts: spacemit: enable onboard eeprom for OrangePi")
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
A TLV write through u-boot's i2c_eeprom driver scrambled the EEPROM
contents and left both ports without a MAC address on bananapi-f3.
I checked boards schematic and eeprom chip datasheet of bananapi-f3,
whose links can be found in commit message. After changing pagesize
to 8, TLV write and read works as expected.

Other k1 boards which includes k1-bananapi-cm6-io and k1-orangepi-rv2
changed together. However, I don’t have these two board. Be grateful
if someone could test it. Schematic of k1-orangepi-r2s not found,
so keep it as it is, but true knowledge comes from practice.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts | 2 +-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts     | 2 +-
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
index 2c2d78aee98a..23a1323df30d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts
@@ -101,7 +101,7 @@ eeprom@54 {
 		compatible = "atmel,24c08";
 		reg = <0x54>;
 		vcc-supply = <&buck3_1v8>;
-		pagesize = <16>;
+		pagesize = <8>;
 		size = <1024>;
 	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886bf6..1db896536256 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -195,7 +195,7 @@ eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
-		pagesize = <16>;
+		pagesize = <8>;
 		read-only;
 		size = <256>;
 
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 790234f3550a..8fd95c8f9db2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -185,7 +185,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
-		pagesize = <16>;
+		pagesize = <8>;
 		size = <256>;
 		read-only;
 		vcc-supply = <&buck3_1v8>;

---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261122-fix-bpf3-eeprom-51ba6e0f110a

Best regards,
--  
Zixian Zeng <sycamoremoon376@gmail.com>

