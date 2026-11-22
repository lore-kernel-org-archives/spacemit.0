Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369141;
	b=26HbyEJmQQelsXOQk4EzDa2bqmigSoEGKpRT2XBozrirztZfZLlBP6cGtBesYgef25rx
	 VT1cf4xFcHX1Qd4oDOSvEfO6lO//0kAL7XA0+jKCPJY8tgpP/nzwLQb4hmhKyiQxc5QpQ
	 3m01Bg4PLYWZu9uRidDIiVzKb3kOkHnXW2RtueBmjghswoLtufLevBtM7IcHD0ydyzg0P
	 JOlyg+BVe7NhkOsV2VPDfo51ChXbuSdQCw1eJjg9OqEkheH778L07kKI8GMPF8RFBXncL
	 ZMwQvGm0rZTf09cRtyYh67eioJz3lSEG2xlE7AiIm4Zob8KpKXKUksdbnLs66O83dqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LlFmwfQRuK6UV6XJmGVYSVgXfF3MLqCw1TxtpepQm6U=;
	b=oFibE2zzJmcoTl7LU4z3fmV1VuBDDEqymfT/Kq/j7bHEfodzH5mtwHhZoqghx1+uPe48
	 8d/iUw5iako/iTjjSqNaw0nmJOyParVpJLVOyZ+ewM18cNjcZwF8BHL+uKmXfaIKBWd43
	 eRIx9sRAZJIevpqL0fIoV+iujTBR+WrQaTiqh3C9KuK6UDsQ3RuBeZR/AMjmDzyORZhNK
	 tCnktwu17O4qTbAhIs3pnHuBGddyFyG41cmGRBoXROSuWt9ooFwQrJG2IVtwzGh9O5oFT
	 ZEPCAo53k2YOm5co0X6BEnfXZpXUgK4mRfh7SyIZhWwSfVQTSLIURawtvN1xDOY2Eyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vq4+XvRA;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2567A606A332
	for <spacemit@lists.linux.dev>; Sun, 22 Nov 2026 17:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2567A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vq4+XvRA
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38644aedba1so3493795eec.0
        for <spacemit@lists.linux.dev>; Sun, 22 Nov 2026 09:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369140; x=1795973940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlFmwfQRuK6UV6XJmGVYSVgXfF3MLqCw1TxtpepQm6U=;
        b=vq4+XvRAUpeBIZXEtK8ntfkW6hyI1IWn51mlfoQ0JXGn6To+4CnwxuPqjJMDvRGrep
         /QKdnJYsEYbWGhd/qXr791Xomg3sf6XHZVcSlNJJy0uHenJYbHSvss1CSC3B5x0v0EjU
         K3Xt+vNKuvF1ojTk4+LPuh0x0RYj6sPf3Da2Vi+O7nNIP7dXcQIl3WNySolG2fDI4mOv
         4V2loSAYs8wQ5RutwyJOOv/kgQLpJ/NSZ7h43yF7J9B1xRk74bgGiQ3CJdUiNosNTCsp
         ZBqVNmdG6kZmsKk+mm0gVCksqVTprnLFzDrGEffivd4knJk4EYUiy0NUi5o//RgkYyGY
         2ahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369140; x=1795973940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LlFmwfQRuK6UV6XJmGVYSVgXfF3MLqCw1TxtpepQm6U=;
        b=j7Rmy20jPtUv7MqQ+fhyCmbEXyhgt1phEthY9OG4PzarqhmMacp4L+OQGyzlFAQe7e
         /uOa7zVZcvDaiL82aYMDosS1O4oplxfMnvhkoVgAHq6bo4DN4AtWornntEPlz58q/xhi
         LJLHj87kPguxBXdDVAOyvhjNknJbznd8816ty/WAc7w/YGwllL0ovCaYB8QyE8AtHtgm
         Q5pUUyPxTOJgfvqNxVKJzHTSv8WcCFhRHqNmzU4uC95opAXVZI1HcuyqaP5UoxXgqxcB
         oumL4Krf+O9ZUnUu7SqYCl1oehy7Kuvy/GdHipsIVooQRoY/V6V91KUJyRZ3GOS1vfkX
         00FQ==
X-Forwarded-Encrypted: i=1; AL+hErE63QdmkUt3Ntq7BO2EpUtIWWw+cB9plkRILOzqHWhRkjX0PofJ0Ej/LYudClYZ3zJhbsGGLw3Icg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+8/PW/KIAGZWho0g337ytF7WEKfDQJ/tLJUuXzHaCQcqpFMF9h
	vkUdvoV/tdcCS4k1L9BE/FaiqTUNEeVB1i+pcF3QeK83Wt52X4CxO57B
X-Gm-Gg: AZFdTZeeo5bYWeHGW6EKQsmKTKNIyj3ynhBdfOkwJi935/4dRq1wJLWZ7G0BbONdg0A
	XIBvJ/s41qybUD+11mPfHT/czQGYJYtQwH0/jiSUuQSF1KEfAQTbR3io82qQ77/eDK5cRIJ40nF
	qUTz9vsqV1kwj8lVtGvqqk4gc24x8hJ0BYQbN+pv69WTKNoTXb27NvIiYOSzn56IMlJPYuv2Wr4
	0YR8RI+JEVUgqHfRPVnt0XkrdgDSpoUaW9bPEwFL3n7os33Ta0go05ah2817FPEMTELPfCORroC
	Fh+fu4nb2TMOTf7kgrPbgeCaKcNEDdXoelOOpC1KcgYfm1MScq3cFGOQb8OBpL9PxaxB7U7cU/Z
	7cXpvIDIJ8qFYuGsz19XkkULagiFeEtn+mD7AKK9ttSzOkTWmOiPeK8t7febV6FGR3rtB7QsM4a
	o4/+bHl9DuYOJwZurAba7IDcAdRKr2V2MNcSoNPGFR8SFPTYqyKvsyhA+nGCJQKECKKgH4NdXQD
	JMKkJcu9dLhoIr819Z0W4+IjWf9Y7pDHlxe12xnaRMA0tvXN2ql4e4plIZFnUk9uUBeZ0YKvRws
	qDBoh+ErUGxGSqzt22M/54KlxN1iP3fEe9oeYMj2cnEdEAlinA==
X-Received: by 2002:a05:693c:42d7:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3856f84fea7mr9545686eec.16.1795369140294;
        Sun, 22 Nov 2026 09:39:00 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29097985eec.12.2026.11.22.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:38:59 -0800 (PST)
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
Subject: [PATCH v3 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Mon, 23 Nov 2026 01:38:10 +0800
Message-ID: <20261122173810.2409146-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122173810.2409146-1-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
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

Add the K3 eFuse controller and NVMEM cells for the temperature
calibration data in bank 0 and bank 7.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..af1a758788ff 100644
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
+				soc_rtemp_trim1: temperature-trim@1c {
+					reg = <0x1c 0x1>;
+					bits = <0 8>;
+				};
+
+				soc_rtemp_trim: temperature-trim@ea {
+					reg = <0xea 0x2>;
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

