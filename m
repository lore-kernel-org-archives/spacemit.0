Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574721E0DFE
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571831; cv=none; b=K8sF0Efjl/g4XH+iHG1dOepwv+x4vBokoGGzXmPbdpU/GANBGtsxZOGk0orqubryn3sYaSqrv7Qx4hvkdybAmpxBqDAW6io+KR8oOGP9uMEIylXS7x04OyX1QyxfNQzTx/EGBgi11SOcpZxm+GyrfIqS6FtFNAwkvMshZOYCWQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571831; c=relaxed/simple;
	bh=BzKRuhxyonoQsuopPQdi/8jOGmwxXgdxHX/BXxXKdik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1e5+vLyDFrFPF/XEM/OHG1cwRxL52UsxiSoiKxrd728XIR9rYkY3/3H7Ef5A/hjQN9lFOaGtZ7R2n4a1kksn6nX/JeIF129gt/Og0dk6B4eZb78wjppHecqnX2dretKSSS9rGFugj3fIS6tO8cpWnRaiV8yXKAoTeTcj2Mh5j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Ifrggozj; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Ifrggozj"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-93e8834d80aso189231539f.1
        for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571828; x=1762176628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdMeTbCiZFImBLpdSseleACrRi7JJpgsujeJgyCXmeA=;
        b=Ifrggozjz/d+iIHnis8abtrsjGMs3QXz6YscQpG0fefIcLjilETLkMj/kKp49icIN5
         Nn1u4mpuUOf7GvKq7nzz0pWEECZ4EgSl0ojNUi7NvA575CMiPrlY6RZr8TjZQYnwJb26
         cdwX7GvxBYVGZRGxOU+5Kl+F/imnTozi16gXajmC/azIE48f4QeGQFV04aI0zmGWmVLa
         ymm3Gy747k1Fp8BjA+YX3LTkwZNGfzyDzzI9W27Q/IG9X5srMkccEe/9As81/h2jVlBr
         k9IlrNXANpuMn25cns7upXFNJi3P+l+GLQcLQx1xMZ3yiVe5/n9l4I2AMELk6LS4xy7v
         CypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571828; x=1762176628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdMeTbCiZFImBLpdSseleACrRi7JJpgsujeJgyCXmeA=;
        b=WRRHXghrYKe6+9fZxpnvaj4nDcjAVTIes3tna61fj0S4LxD3Jlm9UE1tmw/mnldGfT
         qIuW9faSRNn6XtcVKc974dsxNDzmlf1lKZnqH5PgU4MrXmKLOvmcxhfS7wngMD9ohr9G
         B2LnvkscP/lr8OQc4JrQoEmakO0LEKzr7wibmwjDmjCyfo1ODnffqmkg8M375JXhNI/L
         udvB50/nXqwVJeGXtpp/IJATOsbM8Kv85s5Czz5eoyIxjrj35ea9vDbIhV7cxA5OX/Wg
         ods2anxaWcCghYpMBVRN5Wrc3UF6N85xP5SquAbU6+sRDo3wmI4JClfmK6aUU1RpyjHF
         RLzw==
X-Forwarded-Encrypted: i=1; AJvYcCU6iihmH66fQTNiAIbCUc9zEu54SErYSISQMUES5AHwVDjngbGBlT91rhDI19a9TYeJI/CITW8szw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgPYXOrkgQuFCh+BQG0e0u34Zb3wBk3afRPqP6geI5U9nWDKHy
	Tr75xWuraqBbAvL15hOEn3DlKX37pXIlQujBmF/6JuS6gwe9YDfNlU6VkmRoiNLTHbM=
X-Gm-Gg: ASbGncu00igThU21Uq6PR1+12GOmSBpN68PhC0f0GH7KjL/qldQKfBH9PDlyRUiQcPQ
	+5x4N5SmJ94MOZmpHPWxcW0cEBiP05znf0HlwefC9rL6wSYKgGUbZO05A2qLu/4WfWQNcPDw9Jd
	IJ67IW/yrzimdewo3/DV8GkULuZKEtC96jGbaFLyvCyUigaDJBMLfkIFRDUl/hNNTXcdCIneLK0
	yd1LCJk1dM6s+sWoBBVWacoMJm05OrX/ecmvhiMU0AWqtpcdUtLqq/hhLGyr0oXGTCPv8ZfUTIZ
	viqbxjRB6+CoBft4r8FJE2AvgFgkYb76nrn9mlFOvYQW7tiNpV5aSbFaEd7eZ2weJfsJJKysjTG
	QQpUUAXi95Dc4m+fNamJWhf2ZPx9T47fNEW2B8av5/NHpsd8f9I3If0g8T0dFSMT9XupJx4VAGm
	01kV1/tSJw7vryJYRX3W8relXk7nVp9cGMVT4Xe6y0RVg=
X-Google-Smtp-Source: AGHT+IEwi0+D29qzwfaIeFc/gnHZPerYoM3xz0awvDXq4gN/Y7hOOLjB+JgF5YW9xp73OHzxinZJ2g==
X-Received: by 2002:a05:6e02:1848:b0:42f:9847:15bd with SMTP id e9e14a558f8ab-4320f860164mr590635ab.26.1761571828284;
        Mon, 27 Oct 2025 06:30:28 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:27 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	broonie@kernel.org,
	han.xu@nxp.com
Cc: Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
Date: Mon, 27 Oct 2025 08:30:06 -0500
Message-ID: <20251027133008.360237-9-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define DTS nodes to enable support for QSPI on the K1 SoC, including the
pin control configuration used.  Enable QSPI on the Banana Pi BPI-F3 board.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 33ca816bfd4b3..02f218a16318e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -113,6 +113,12 @@ &pdma {
 	status = "okay";
 };
 
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 4eef81d583f3d..e922e05ff856d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -73,6 +73,27 @@ i2c8-0-pins {
 		};
 	};
 
+	qspi_cfg: qspi-cfg {
+		qspi-pins {
+			pinmux = <K1_PADCONF(98, 0)>,    /* QSPI_DATA3 */
+				 <K1_PADCONF(99, 0)>,    /* QSPI_DATA2 */
+				 <K1_PADCONF(100, 0)>,   /* QSPI_DATA1 */
+				 <K1_PADCONF(101, 0)>,   /* QSPI_DATA0 */
+				 <K1_PADCONF(102, 0)>;   /* QSPI_CLK */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		qspi-cs1-pins {
+			pinmux = <K1_PADCONF(103, 0)>;   /* QSPI_CS1 */
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index af35f9cd64351..47f97105bff0b 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -823,6 +823,22 @@ uart9: serial@d4017800 {
 				status = "disabled";
 			};
 
+			qspi: spi@d420c000 {
+				compatible = "spacemit,k1-qspi";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0x0 0xd420c000 0x0 0x1000>,
+				      <0x0 0xb8000000 0x0 0xc00000>;
+				reg-names = "QuadSPI", "QuadSPI-memory";
+				clocks = <&syscon_apmu CLK_QSPI_BUS>,
+					 <&syscon_apmu CLK_QSPI>;
+				clock-names = "qspi_en", "qspi";
+				resets = <&syscon_apmu RESET_QSPI>,
+					 <&syscon_apmu RESET_QSPI_BUS>;
+				interrupts = <117>;
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 
-- 
2.48.1

