Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD7C502D42
	for <spacemit@lists.linux.dev>; Mon, 28 Sep 2026 23:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637585; cv=none; b=aFYD2pQHX5bRSO1nY2JABR0DkpcA1Du/diyyGft/cdWDDm92THoWDVSVa1uOWL1TBvP+tZr/ToEL44PzUAdA2zSIR8bnnMtomsVw//UTu/kQGB/LxjIYjXK+m7q8nWZX9K9BgUBpz2iVTzlvpAqp9ikhI6EL028RzisKeMY0ydU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637585; c=relaxed/simple;
	bh=EHfy6hM5pM0etoyr1TjkORgk67ORR+GOL0Tj6FPVj0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=UoYVBR5Aw7hnHzBnbHHDodd4XNV5B/ak0ubio7uGS9JX3H9PF5hA1Xc//6ZGD8B2af7LG7u9XEjt7k74qaAjw4QMsUPUHfzxmxGjcbFJUjkcaYkgnIRP+7HplLaJh/gjCHUaEQa6EO89a9gGQR8ZOIuhSGc69vHT6daHJAoH9o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KdcCe/aU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KdcCe/aU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtdRzVR0GqocmezHAih5/qMYcLlASDScftoV7S0BSYc=;
	b=KdcCe/aUtopoqjOp+XClvNAEnMjXORLGgHoKe+ohtJTsjCkgTUWQPrtEvN2LvcGadP5062
	wCk9C3BCeOCOc9GpWf6GEN7iHcfPiZpevs9bZG9eHtsuRg3BTZvR3gZJfz3+7n2fiKhyN1
	nVvFyEu7v1JLp43cEGRpvomLL7NNvrk=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-NwWE0FfWMsuz9Xe91NVi2Q-1; Mon, 28 Sep 2026 19:19:41 -0400
X-MC-Unique: NwWE0FfWMsuz9Xe91NVi2Q-1
X-Mimecast-MFC-AGG-ID: NwWE0FfWMsuz9Xe91NVi2Q_1790637580
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-674098a3b87so6467279d50.3
        for <spacemit@lists.linux.dev>; Mon, 28 Sep 2026 16:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637580; x=1791242380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZtdRzVR0GqocmezHAih5/qMYcLlASDScftoV7S0BSYc=;
        b=a/5JZjRruBQnqefUNRRBH0Re79UtcUlqrls1WlUMWsYBocOZB8VJHFyBCI17n21xwL
         aA+TZo+NCD0cHOaH+Oy/90EtTkSqg6DRyCbWAhY+LKEpyeucsYy5lpjC1pPhDb4zPzKf
         hvxRfxY/3gbIgIiHnCtsgTM/88mpR87w4ijpw0mIPHYUBX4BtiCUfAGv8LQEM99j/KyR
         P1T3ScEdwNzvXWwe+mABiv+assp2YKTpaP1mOL6e5sjVRYiA+19qu+WLbmT6gQ3walKE
         zsNvmY+001Xmi1sPAuEIjGCA6aOvyL9hx7MQpxpIijuH0gIZExnrHWVFqLFR1Ksx1Vy4
         3RLw==
X-Forwarded-Encrypted: i=1; AKwUvByqXgeTWys6SdOeNZrz8uv2wKPZU4cuABEt9qS4CdQtoWgnpZgg05x0eGcp0Fr2g9GqJ1flgIGwIg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJea3naEYZEyHJn3eS1cdVevRrJJt6QUtIycC1YNE1ZqpzCIbdr
	Z3cPZ1xCvJzFwcz/lfe8XBRkTh9r4uMBgqxicskmPFUKd84H3Qd2KO+i9ZdzXUQioy4PdGHyUK9
	ov4iTEY8t+2/iWuC/e0OCOoV8xOqNXxFmUOowjIP1HGqcIOYzKnW0U6x0SujY
X-Gm-Gg: AYBFou2sl1itpIvQuVDBoaFSd9WXpX+RDDyW17lKqf1K7otRAHq7Y4o16wxD47/xYIb
	1chOwnbMrBzbYC8xb0pNPww52pNHZ+5i8XtHzOTg59fZk3FOwt5iNc4BsG4QmnCh4Ya65YB+WkQ
	AZb+vOiTdEoi54X+G4dITAZfiJ07F4trjqKudmSgxTCCz4l9Inf+1WFA3Wknw7W/jfeYzzrjq/N
	nFyw9gbwIpW5PeFYlXruZSFYZ2PW87SEe2AcgIB5PAoZhto46tbsy7uQAf+ZCC5RqDwjONy1OE9
	dI4azkAk6pz0kE5xM87TUdw+cFwbMPnGJv7o5CJ9JtfWFevER14yKQ==
X-Received: by 2002:a05:690e:14c3:b0:675:548e:22b5 with SMTP id 956f58d0204a3-675548e27ebmr1292546d50.129.1790637580524;
        Mon, 28 Sep 2026 16:19:40 -0700 (PDT)
X-Received: by 2002:a05:690e:14c3:b0:675:548e:22b5 with SMTP id 956f58d0204a3-675548e27ebmr1292538d50.129.1790637580114;
        Mon, 28 Sep 2026 16:19:40 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:39 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
Date: Mon, 28 Sep 2026 19:18:07 -0400
Message-ID: <20260928231807.1757995-5-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A5IZgaPdH09ekQF1pYS8x_60FDarjtmoYvKlFgF48eA_1790637580
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

K3 CoM260 IFX has an M.2 E-key slot for wireless. Add rfkill nodes for
the GPIOs that control the slot's W_DISABLE1# and W_DISABLE2# pins for
WLAN and Bluetooth.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 01e286cb05797..cd878340e5add 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -47,6 +47,20 @@ reg_aux_vcc3v3: regulator-aux-vcc3v3 {
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
 	};
+
+	rfkill-pcie-wlan {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio K3_GPIO(73) GPIO_ACTIVE_LOW>;
+	};
+
+	rfkill-usb-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-usb-bt";
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio K3_GPIO(57) GPIO_ACTIVE_LOW>;
+	};
 };
 
 &combophy {
-- 
2.55.0

