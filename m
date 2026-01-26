Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AC633AD90
	for <spacemit@lists.linux.dev>; Mon, 26 Jan 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769435966; cv=none; b=Pd/iz3/3joFWNsOjLJXS8Sud/Jg9AP1r918EI1ysquQhuhS5OB6hQeKAZ37duWGGDKdwyy1LMws3JsyVaK+oHhtQ3S1IS/KniYeJvYbND0ew8MpGGKV5fImabqlIQz5eUY7uSQ5RQTLdEB5rhfNBVXXDj/UJ6EYk+742Lkyid5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769435966; c=relaxed/simple;
	bh=YyVPNfEOsRD7xz0I+FVk9lX1gzfrVr0m2ofGUZWRJl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qI/6j+WrevFsmUQ2btfpwjpBrEeDvOI9JFxcDGS5hN+C2/3UY6rOm9UFkMtPdnFw0DsV3KADWvYmQIJyhLyFinaugsVnyJnUMmW+gnb4PKMnPSP7yFdk+3ume1ndz7eG1m38PjP9opR3R7exGJlsQXQt4ceb00G7OXBfHmxVa4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6GXmQ5N; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6GXmQ5N"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee974e230so41614455e9.2
        for <spacemit@lists.linux.dev>; Mon, 26 Jan 2026 05:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769435963; x=1770040763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XVJ9Z68aHKVQR5TvJwQMXLNoEmAsqHmqBFFlgBpron8=;
        b=J6GXmQ5NlwyUVTIRu6atozZIoX9gm49PnD63ToikQfWKcrqahKterq/SFO9CvmsVkS
         upGI249bnvIXXkmOUmVrIJSaHMSBnR5//3NF80OlDxC0fPNenBDs8F0H20IkAYycjXIM
         TuG8+lX9hKPZfZZOL5IePnozGABxSv3c0qLOxkUm1E7GUZl04CnV4t0g6SmvNbm7OHhv
         62vrR8DAzS0r46ZmW4DNrobZTfn8MeOnhvVbNK9O66niuSGGxjaob8V0kz86/+6NdQKH
         Uc3G2xLxrqjKiq8lBZNaLb497WSifQl/peH6BF023TATn0V0ZgU0/ilQPKLWkMASh/v4
         1ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769435963; x=1770040763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVJ9Z68aHKVQR5TvJwQMXLNoEmAsqHmqBFFlgBpron8=;
        b=D9dFjalI1ZUSlFda4lXxFDISN7bjmxn0J3squJRdWAfj+5a4DhiQHndXtqamA9htY6
         cOiVgbKMlc69IuYz3d06QkXJBSWU759Kq+SNIZE/FJhXVcEwS5T8DiSgXMOqAZpYhPrE
         m3KA8OMtVxxOAOQfRxwOfWzAqj/XfJdDaZRxYICNhy8XJqSo7epM3o/jGGIiOuHkgb0G
         1SU7N+tKg2jd+JxnVhBob7LFJGHiuxEgSd+aZC8ZUTZ2N8yW5IK5K1HkclnB7qdT0jwK
         s/aj3KotR1B9/LFguxMCZHRC0q+9TKlP2PR5enUlNrKAEH+2C3DzH7R6WdwW/EyRMwSC
         ZioA==
X-Forwarded-Encrypted: i=1; AJvYcCWASttAdYJWZ8EtiY8uAUQrePdZS/k7ZrCPE51uagGgpQi5oxE3AQ4mN68CxPoxIMrUAONwbFqwhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz622TupK87Ik6JHSeMiC3gn3EhsoQ6jjZhqsjldhN9k6PjgXac
	51Kfij0kmIVumfXcAoQUod4vwQIUlTcHlYwSoXokoy6/v5DW3moRzBY=
X-Gm-Gg: AZuq6aIrjEtVsJNWSwgpfi+/Dttw7/Adqr9agSNWfIDlL2n3tpLXUqlAtWDzT0tI83U
	UqxtYoL2Z+tjlioC90kJtzEZvhU2MbT9qaqDPThYbcQPJ2gHRXkCIOZJw7J8PgvqbMkpXqBbi2F
	RaPq+fgwLrgrf464rTF/38gQ0wQ7nWqvyTlKrI4p9BQMHy25DL0YxdleUmyC2jRStRRhYntAS+L
	5/w/D/eaB/2cDcvAshnRFbtJWt3co/Q9gXFUJCQ9m8aos+Oqenvtp7m88Ks2GAV9dpTt5wCaGhH
	1kaoA7NHXD9FjS3evcoC/TfSxXepD1F2DrxzW5CrGTswQV7XoJ8lOil3nSKRROgIl05j1n3NugO
	X/M7G8hDfLM81ymtSRhtopICHUIAsta9QEhWxT1lD0B4myAG9Ja6Cjh/7m1tI43cuq0Tj9CCAhS
	D3jUESwbMrngr2Q+c=
X-Received: by 2002:a05:600c:828c:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-4805ce4e740mr82914185e9.16.1769435962638;
        Mon, 26 Jan 2026 05:59:22 -0800 (PST)
Received: from localhost ([2a02:169:c21a:1:5aa8:4ea4:a58b:fc48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d5f422csm109898745e9.2.2026.01.26.05.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:59:22 -0800 (PST)
From: Tomas Hlavacek <tmshlvck@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Yixun Lan <dlan@kernel.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Tomas Hlavacek <tmshlvck@gmail.com>
Subject: [PATCH] net: spacemit: k1-emac: program frame size registers for jumbo frames
Date: Mon, 26 Jan 2026 14:59:19 +0100
Message-ID: <20260126135919.77168-1-tmshlvck@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver allows changing MTU up to 4K via emac_change_mtu() and
allocates appropriately sized DMA buffers, but it never programs the
MAC_MAXIMUM_FRAME_SIZE and MAC_RECEIVE_JABBER_SIZE registers.

This causes the MAC hardware to reject frames larger than the default
1518 bytes, even when larger buffers are allocated. Frames exceeding
the default size trigger jabber errors and are discarded.

Signed-off-by: Tomas Hlavacek <tmshlvck@gmail.com>
---
 drivers/net/ethernet/spacemit/k1_emac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/spacemit/k1_emac.c b/drivers/net/ethernet/spacemit/k1_emac.c
index 220eb5ce7583..31b1bdb2827e 100644
--- a/drivers/net/ethernet/spacemit/k1_emac.c
+++ b/drivers/net/ethernet/spacemit/k1_emac.c
@@ -228,6 +228,12 @@ static void emac_init_hw(struct emac_priv *priv)
 		DEFAULT_TX_THRESHOLD);
 	emac_wr(priv, MAC_RECEIVE_PACKET_START_THRESHOLD, DEFAULT_RX_THRESHOLD);
 
+	/* Set maximum frame size and jabber size based on configured buffer
+	 * size.
+	 */
+	emac_wr(priv, MAC_MAXIMUM_FRAME_SIZE, priv->dma_buf_sz);
+	emac_wr(priv, MAC_RECEIVE_JABBER_SIZE, priv->dma_buf_sz);
+
 	/* Configure flow control (enabled in emac_adjust_link() later) */
 	emac_set_mac_addr_reg(priv, fc_dest_addr, MAC_FC_SOURCE_ADDRESS_HIGH);
 	emac_wr(priv, MAC_FC_PAUSE_HIGH_THRESHOLD, DEFAULT_FC_FIFO_HIGH);
-- 
2.52.0

