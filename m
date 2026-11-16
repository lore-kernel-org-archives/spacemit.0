Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830085;
	b=ezoaXJqbefb5RDFZRihfJxn4GD/b/B55COWPf37J+IGfqtN+OK/8JTT2Bu5Sld0hyfO4
	 e0L5CXqDr2KdLisxIBAaOBgvM3/AMv3nPHKwnpvwpUTYdBeqP1WJvERBmOo9FkiRtBOSm
	 FaROJY8t2BVc4FLLRpNDq5p53LvKc082Py06zWoYen+PihNi3c0epVGepbASOSW2nlbDu
	 PPRRCZR8g2/0F243q9TxO8zlWQYQ2+7cZ/zVofuPqa5vtnSI9lDdSaK8zbX+lUghJNzgj
	 RptVXswYQpB9xNEcBuxs/ZH5i2w35QP2tQxDdDCn3+fJwk1JsFPZPfXy0wdMAIAHrog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830085;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=hlKdAuKU6/zlzy78gLmAnVvUOZiQT/RfQGf8vqVj9/4=;
	b=nDv2FODIjq1qUnfwnFHK5kMzia75dZeZhy0cyYjWGxLSz/xmsHzb4ViJYcrczut4n2Fz
	 DM4L9a9kp116S04mRDf/MHa+iWcvabFwPmueKR4YmsjHjlEytoolCZGqPY0k9g6BjP6Cz
	 S+u7NSOEQEQ7usxP4kPQ4MnGbmGxpiMnYmVCRc7Wx4uFrs84ZMDETcE+bOBBj/u1lgYpK
	 7A5/28F5zdsfHt8T+MH+Kxj5OPeePCZEoGCdgs9U1L9N6xS3SoyE6uVO7/KIsyjRpcwj4
	 eCmFtG6MsgJ1mJIEqveEsgs1Y2gp/cqLTgN/Zo10S44R71E0tQzUBnxVKyX1MK553Zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=F8t3kHBv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AF8606A32C
	for <spacemit@lists.linux.dev>; Mon, 16 Nov 2026 11:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AF8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=F8t3kHBv
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 16D3F202929;
	Mon, 16 Nov 2026 12:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794830083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlKdAuKU6/zlzy78gLmAnVvUOZiQT/RfQGf8vqVj9/4=;
	b=F8t3kHBvYsxFxiojpYcaaEO8yZNbDqfUZERwscJ7clfA3vc3UGoWxoRKgurki2oUASVnY6
	4SC5dgmiGXD7TOOfjHuNJ98HnET3RbY3UtrAOZF+KVeEehyJbpyJg5XqmyOiK83XJLqsuU
	/klh/bDYmypg0l/SKOD8t+kLXBSgI2XuyyiEgfFz6CQyubqXy3t6YxYVf2MoVrdZobf75Y
	lt7+0p+kcBN2hW+XaoduqZ5qQ1kcdzZKb1wAYo011YqngA8G1QHWUj5n00uktU5b+1Wifj
	XPtqMI8sympbe6++lo7ilkgxWQGF2UDqOXORjcn/BSihErC7bnnipPqzrurBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794830083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlKdAuKU6/zlzy78gLmAnVvUOZiQT/RfQGf8vqVj9/4=;
	b=E189z2N24A32vezLb2jV8FGurUV6OKE3Jroj3WDbY2h+i5w4TfbruF0Nn2Diw+mDDGzqG0
	9TjxwuRQt6BX6dv3IZaXORTHz6BT0+k5xJb2J58b8psu3zKCaj38pFeR4d4Z+rBgNg1Q3x
	4iM7ctQEdFbxCY+yKX18b7sK6AhNTdyfoWsIfZLZqJl8EJtj5M29UJuozqPpVkuJhEbR6W
	Uh4ZW6qkLcn63fbi40ZuNnyTY1jhXzs83+PNAMwShOSenhSk4iRkhvUuIDxszYmqMqsRnO
	75fUFWC2qTTrE7BkOqSiGtLWHA/4WmiFVJh4J6Ae//0fTh28h47ilCTRyhbdRA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794830083; a=rsa-sha256;
	cv=none;
	b=Y6aaFE3qrHdo3IorAfip8dGqpTrhQTAmWbv/iKn1Kqt2bCXFlO8PW+mhk2zY46GJ/9sSzb
	ABLtgqW4cCza/WSHEg1olQ7Hzm4fzpyPDgmEgc7tpE93qUU66gff1CrGavGxtj4Em/mWbw
	w90x+26TSghd/X0jX07lLyzut+14FjeOt0YJdb2eqV1zFl1M412HjqvqbJsDLIYrWU76GZ
	l1GnutQv+I98I66jd/VWhhIAMlz3s/zQdpk5/bV4HPtrBk6X9/JZXe1sTbp/XwWJctbcNj
	PTmSdXuEnXA+IdpZ9B4aXztLlCsJA8xGbqdl7MPSgARBcKa45jDHdSndUzQ3Cw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <65f843b0a46f14df575d998acceb40b68fe64a62.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlan@kernel.org, 	troy.mitchell@linux.spacemit.com, me@ziyao.cc,
 aurelien@aurel32.net, 	pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 12:54:42 +0100
In-Reply-To: <20261116075423.1519438-3-duge1256@gmail.com>
References: <20261116075423.1519438-1-duge1256@gmail.com>
	 <20261116075423.1519438-3-duge1256@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Mo, 2026-11-16 at 15:54 +0800, Jiayu Du wrote:
> Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> controller. These banks contain temperature calibration parameters and
> other configuration data.
>=20
> Keep the root key and SSK registers outside the exposed bank ranges.
>=20
> FUSE_READY reports completion of a software-triggered reload. Trigger a
> reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> snapshot. Fail probe if the reload times out.
>=20
> Snapshot the shadow registers with aligned 32-bit reads and expose the
> data in little-endian order at controller-relative offsets. Serve reads
> from the snapshot and use keepouts for the remaining register ranges.
>=20
> Enable the AES_WTM clock only while accessing the hardware. Leave its
> shared reset deasserted on teardown because WTM_RST resets the entire GEU=
.

I don't understand this, possibly because I don't know what GEU is.

What is this reset shared with, and why exactly does the reset need to
stay deasserted?

regards
Philipp
