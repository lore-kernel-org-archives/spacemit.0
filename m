Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794998999;
	b=XKpXaVEtprtmg+1XeSK0go+rf2PfrlseSt65LefPz3cocV5XT1DGrrEoPhnY4hjIKYYH
	 JaoIBKH5IvPws5HrCHYXdH3DkwSje5JsG63EAb6Bv8+a34u4COrEvxsVNbYOOIP3Y2BF3
	 9Znh6AtS4v8NMxVf8nZkQq5II9aXRr0/GWsS5nvL/dMw3+cMROASCGhSvIDvpLzkT4NgG
	 1cIxfxxhx8FqrTbMDrM4cfJFtxa+FD0fXTnvUYwcjOYbbCQOJj+zU1rAv+lf1Hd/jB8UO
	 GRo2q7a9yVz/t42NWz9BDEpSBLBGft6XSgoB/49IhYPHo0+/AH//OUFYY5PDOarP1OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fimuKL704+w6i+p1mK714enmZrR4sYS+1W8BVN4RDvI=;
	b=jI94WFCx4IhVX1uQTR5ZYQOzKxFrkkPgXVMzCjRV8pAbDh3VrMQu26G6YJC7xemtyZyw
	 /C/b29UpMNIph09gyJTBe2ImqnpZJSXeW2MCEM+8umtLda05KtobCwXVuZm7hifr70ZfJ
	 qQtI2PuCmWQ3UBH2VhQq0cOOP9HuC4mpjWZtGmv9qInO7FnD55ulow87MkGXlAoEul06L
	 Obh7B2iah0CLbrNjFlEUlj+39nxLOIQ2Ltqiheou/bTlVI/dLVM5pYWoY7t8G8rb6eqiq
	 QFqo4yP/1QMkpg0mkD17+RX1mLiCUrRbhOd1jvzSfaZ/TscHPUD2P80NAM0cyxC5VnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C/LKW4Lu";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363C0606A32F
	for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 10:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 363C0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C/LKW4Lu
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38318d69173so199374eec.0
        for <spacemit@lists.linux.dev>; Wed, 18 Nov 2026 02:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998998; x=1795603798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fimuKL704+w6i+p1mK714enmZrR4sYS+1W8BVN4RDvI=;
        b=C/LKW4LuMjSzb/lMdHjTt3vew+zvg6vncn2QetmVh2So+C65eeQuoay0oIfC6MmjJj
         utTmjcNKtD6ggRa539X+3lXEiyKdwq/Zz184Ar4oBYUp6wqkaSFnlgDLRwihhlPrpzVv
         fRIml4xGteP8R90dUMy/tubhZK8UlKBtORmiOjyT5q1CS9IPqNkbS3Rc8AFRqvv4cO6P
         MlgvclssBKc7jE0ESABUp8DuhYFYrVBuLFQb1Vo3cbA36iHUlVg8akBDU49IXwaUq0k4
         HjVV3bC2itqzYPw8uEdvZPPkm9TCmsg+SDhmJq9ZQPZhHrvdgssokvAOREteOLCcvTIr
         EE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998998; x=1795603798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fimuKL704+w6i+p1mK714enmZrR4sYS+1W8BVN4RDvI=;
        b=pdmJN1LyJI7vha1nmG9tEIphDCXefLVqRMdYp5GueHCk6BV0h+wYwiNAe6g/yxSzlP
         +YvbgUGpCT0CM/DAsPm1wRxMn6Xeiu2VhKyG3FmIf06dSHb8mv8YkZFteII22cukPeqU
         h/Nyi+vfmfFbsnR3Gn3V/Jgbtkg0Xy3NPtbAuWxG05fEeP2MoeYBqKAE84NNq1PwLHvL
         WkjvZ0xHN7iT46TdxxedEE6pPqvs/AvR041jJI4vrol+TRoZYiV2fzxvJ1gu/egNJYOj
         GxDd5ZGxHiDSwqFXrkMzZDkE+Aui3mKqVayZemipTZdvNHiP7K+GmB120MZ3Yh4+AHuN
         S0HQ==
X-Forwarded-Encrypted: i=1; AL+hErHMMpXcdq5nLbkNNL2bhni7F19tC9q5KsAUffGP10wmia7R4d08fPh9W6V+ID5wOC8tnIHdQvbM8g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9LbTxion7+Bqdj9CXAmMOTJR/eah9Naf24ghCvwPXTBEyk+NJW
	SI7lvZy4ov1qkkcJccGvOKNtIPAZNSOYgsCyM4YzqIABy+00X+e+Wm4t
X-Gm-Gg: AZFdTZeJWtee4KopSKlLrJX6qeSF1evrUkxUCJHCJvaOqQ2ctW4rkv6UMrzo3+k9ju6
	rQuCevyFOeKN4BTo/NxCgbkipGtSF1z0j5/oHsa2vx82LIL6B5oleXdQxz/JWm4ppQZTg2eFY3Q
	3bODUOd5eCCaPN9jzHGasgk45UYE45KlKite45V/dsJnVXCwJZoerNJ5pjghzRM3znpPjfG0Fzj
	GeBAD+Qc6tvEcpIDPWagdCTNxLv/wfX4apQct8O/dfGsNiL08Xd8EUjQgJSGjfTgRpYJSbs/bmT
	yHqukwYVHc4QQcRzw62WvPRLCgUvnJIfWQaqQuX0Pytk6U+9p4FNDoWdzneH1fMd6ejx7mETdO1
	CKMZJmhq2QgsLgIE75V15oMMpttIIFY1jR7v0NCS+Xitul0ba3kGXtmTJ2Q1qNBNs8WC9uurYCC
	4sfMUMURFPjanPLc8vruOR5IMwUsvrZxDIEo4stRywu9QIXxNH0foJ3iMWsH/QZ1xBob1rtZxj/
	1IHe9tEJ9eCls1Lvn6OhghkBKePz7e2QzMryCE4O0I8cEz66XRWtOXUS3mY0EQVTMNJt2E2YWzx
	FCDsdCNsyAQOte1Pa67XabdpczrNVCBX
X-Received: by 2002:a05:7300:d088:b0:381:a911:1772 with SMTP id 5a478bee46e88-38281215ba2mr2333979eec.22.1794998998227;
        Wed, 18 Nov 2026 02:49:58 -0800 (PST)
Received: from archl-rock5b ([45.112.0.182])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm11729913eec.3.2026.11.18.02.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:49:56 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
	linux-pm@vger.kernel.org (open list:SYSTEM RESET/SHUTDOWN DRIVERS),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v2 2/3] riscv: sbi: Register SRST handlers with firmware priority
Date: Wed, 18 Nov 2026 16:19:14 +0530
Message-ID: <20261118104935.1716-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118104935.1716-1-linux.amoon@gmail.com>
References: <20261118104935.1716-1-linux.amoon@gmail.com>
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

The SBI System Reset (SRST) extension currently registers its poweroff
handler using register_platform_power_off(), which assigns it a lower
priority than the default PMIC poweroff handlers.

On platforms where OpenSBI handles system poweroff, a PMIC handler may
run first and perform I2C-backed regmap operations in atomic context,
triggering invalid wait context and scheduling-while-atomic warnings.

Register both SBI SRST restart and poweroff handlers using
register_sys_off_handler() with SYS_OFF_PRIO_FIRMWARE. This gives firmware
handlers precedence over default-priority PMIC handlers and avoids
board-specific workarounds in individual PMIC drivers.

Defer handler registration to a device initcall because sbi_init() runs
during early architecture initialization, before dynamic memory
allocation required by register_sys_off_handler() is available.

Preserve warm and cold reboot selection, retain the existing legacy
poweroff fallback, and report handler registration failures.

Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Suggested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
New patch:
   Link: https://lore.kernel.org/all/20261110061429.2036-2-linux.amoon@gmail.com/
---
 arch/riscv/kernel/sbi.c | 43 +++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index af1ccea222f1..ab6e5bf25411 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -512,23 +512,50 @@ static void sbi_srst_reset(unsigned long type, unsigned long reason)
 		__func__, type, reason);
 }
 
-static int sbi_srst_reboot(struct notifier_block *this,
-			   unsigned long mode, void *cmd)
+static int sbi_srst_reboot(struct sys_off_data *data)
 {
-	sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
+	sbi_srst_reset((reboot_mode == REBOOT_WARM ||
+			reboot_mode == REBOOT_SOFT) ?
 		       SBI_SRST_RESET_TYPE_WARM_REBOOT :
 		       SBI_SRST_RESET_TYPE_COLD_REBOOT,
 		       SBI_SRST_RESET_REASON_NONE);
+
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block sbi_srst_reboot_nb;
-
-static void sbi_srst_power_off(void)
+static int sbi_srst_power_off(struct sys_off_data *data)
 {
 	sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
 		       SBI_SRST_RESET_REASON_NONE);
+
+	return NOTIFY_DONE;
+}
+
+static int __init sbi_srst_sys_off_init(void)
+{
+	struct sys_off_handler *handler;
+
+	if (sbi_spec_version < sbi_mk_version(0, 3) ||
+	    !sbi_probe_extension(SBI_EXT_SRST))
+		return 0;
+
+	handler = register_sys_off_handler(SYS_OFF_MODE_RESTART,
+					   SYS_OFF_PRIO_FIRMWARE,
+					   sbi_srst_reboot, NULL);
+	if (IS_ERR(handler))
+		pr_warn("Failed to register SBI SRST restart handler: %ld\n",
+			PTR_ERR(handler));
+
+	handler = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+					   SYS_OFF_PRIO_FIRMWARE,
+					   sbi_srst_power_off, NULL);
+	if (IS_ERR(handler))
+		pr_warn("Failed to register SBI SRST poweroff handler: %ld\n",
+			PTR_ERR(handler));
+
+	return 0;
 }
+device_initcall(sbi_srst_sys_off_init);
 
 /**
  * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
@@ -677,11 +704,7 @@ void __init sbi_init(void)
 		if (sbi_spec_version >= sbi_mk_version(0, 3) &&
 		    sbi_probe_extension(SBI_EXT_SRST)) {
 			pr_info("SBI SRST extension detected\n");
-			register_platform_power_off(sbi_srst_power_off);
 			srst_power_off = true;
-			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
-			sbi_srst_reboot_nb.priority = 192;
-			register_restart_handler(&sbi_srst_reboot_nb);
 		}
 		if (sbi_spec_version >= sbi_mk_version(2, 0) &&
 		    sbi_probe_extension(SBI_EXT_DBCN) > 0) {
-- 
2.56.0

