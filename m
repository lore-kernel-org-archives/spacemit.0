Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF8645198C
	for <spacemit@lists.linux.dev>; Mon, 21 Sep 2026 14:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999331; cv=none; b=nMKRiGlVFXsNyPUWSJNO/dVB+pOaSXM3UhNZ526gvFnAyOnby0Pg6hLnX0J1YBT98rK072B/TPECjiKmjv76Uw++RPK1cEtKtlN8FnuYzZbLf9rURP0ABA5JVD+72oCBrwlRjmz7fqAqAoFq6eeIdGp2H0kuHqv+a/31Neq+VEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999331; c=relaxed/simple;
	bh=BjKTZbAvk8PZTX6NDEPBbU5QxCiJduqiAoJFAirt5G0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=d37diK/SF5Fah4Oc3tsbcnNfDX1Lvj13R8NCt3WwyTd0tK5jSTvdRZXAMlKoRT0ZGPXMv+KhR8D5e2FNKQ2gtRCf3ebUHIxVnJ1zmNKCQzu+Y5i5xKGpwS+RxbbILP9areKlc0uzIyu1k2YZvI6I66yAFSewk3R6rn8+hmBNchc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=A/5M+Uo6; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="A/5M+Uo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789999215;
	bh=BjKTZbAvk8PZTX6NDEPBbU5QxCiJduqiAoJFAirt5G0=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=A/5M+Uo6aVAZF/wfcLcIPCHQWyhDr8HQgDH5ZVNF0j0tYL2OcLfvjlWxD3nKKGRxu
	 Ezx5WORznKBPEBbWSm5JgppseaKRsEabcBQ3rUjESG/+sWitsP4/Qy87aSopKjiItl
	 tXgN96G/PoBESJsIHrfiXJBQS0z2f3h8h0eddAo4=
X-QQ-mid: esmtpsz11t1789999213tcee6ff1c
X-QQ-Originating-IP: e1USqraHe/XK8utXY0OK78zXThfLDLub5KhFAHGc3ZA=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 21 Sep 2026 22:00:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5811935857291138792
EX-QQ-RecipientCnt: 15
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=8db083407c1172cd2c3ba6047b5480e3683357a2fb171ccebc9ea7e618e4;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 21 Sep 2026 22:00:08 +0800
Message-Id: <DLL1RG8HO5F4.3SW5317Y4S1F8@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Muhammad Bilal" <meatuni001@gmail.com>, <andrew+netdev@lunn.ch>
Cc: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <dlan@kernel.org>, <wangruikang@iscas.ac.cn>,
 <vadim.fedorenko@linux.dev>, <maxime.chevallier@bootlin.com>,
 <troy.mitchell@linux.spacemit.com>, <netdev@vger.kernel.org>,
 <linux-riscv@infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: spacemit: clear TX descriptor on fragment mapping
 failure
X-Mailer: aerc 0.21.0-reader-ipc2
References: <20260919191937.271202-1-meatuni001@gmail.com>
In-Reply-To: <20260919191937.271202-1-meatuni001@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mu/fBtuBjRZf7Q4FVLqIecgyCgdTGnTGudynQYMLSGefXxDCud2Si+qt
	JeJbjUxuf+bZIYUha07CVC7kEnipiGYod7KCMvGvNXWXrRA86qe9CclKNPLYNv9lOtp5tim
	aNV4BMH4BYxotGpSDH8IrT5GroUu9Cxg1wQ8ibb0EFrVjWcuwSPcrWM6QvkdTDJE57t4gII
	V40XtkhT1zJ0LJyufvtkyJCqajrfsOnv+N1/NqG8PrBXwoRvs5l6bl/CPD6gPF5RauBkjAx
	GR5PgXj5Z36fAUA9RcsRytZRBKKzuO9OkCtkJ/JySGgRQRouIlkEJhVfpBqvLTJuOx5rIq/
	PgfoVrzPWt91I+rsnzTZNQ1H7rJEE1pzqtt+S3XznQPGrjVCUCK2sWpTszPVFJ0mA5rEkqG
	0qpmjtTbjz+wLSahKsjYQ1TQfjT047y2GvCW7U5mpxmVRrL7hS/n3IiMlbhM8YJP0Xy/8ZH
	rgR3HeZWLVmyFDLt7dUPEGY87zqusUeWHVq37RuBAzvw3K9Ij6g2TuInAoDEVALdVIDfWwq
	Gq5fOMuK1ffHQnvGfB3RxTpgquthD/rwR7q+i0U80p2n2z9xe0gYSkLgxkeOK8Ym6y8MkN3
	DoRp0o+KEaD+oUohhywJQOCjlthjw7arpR2dbQe7kcsWQCrlVyjV25AHlbadBwPhSYVaWGC
	na/r/iPljOfRkCOImhB33vaHSQTLazBbTIgBK3dIS9jUNXkPKD7Fb1EYvltLMPeZkkp8dtG
	sG96b0JhG62CrOn+LgHvw0dr9w+JDeZr5/alfjP/9h9ySQNq5GqnUJk7AIrN3eQXN6B4gaj
	Ibs1geh4AH10HiZrBoFzzuT449ZWtcZ9A/WPPSTWBOPygSCXLqz0n1uvUspqkAq3933YxrH
	H8XYLfgGjYSvj5zkdI70bxlbxPZucW99dxtD/gKqcCXOFAwm/u1svEpSWS60/02WT5KB/GR
	jn8KD3Bf1Psoz7DHu3h3+k7Ia083e2oRUz3jfbs91qdCoIeUC8k/5rF7KiuyX9I73wwHPBC
	8yViZ/q1vYtdblHZSbwDgKpJPQqmjgHeiotfvJTGyHZNqhIrZxUsY2aSyl4dtCnORKmjlRd
	aAgkThcyNbq/WXXeKsn4fvdtDJ6NZV+ap86AyLrXIdwkpJ6oXHwYm6DV87T7wCwrA==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

--8db083407c1172cd2c3ba6047b5480e3683357a2fb171ccebc9ea7e618e4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Sep 20, 2026 at 3:19 AM +08, Muhammad Bilal wrote:
> emac_tx_mem_map() writes TX_DESC_0_OWN into the ring descriptor for
> every slot beyond old_head as soon as that slot's memset()'d local
> copy is committed with "*tx_desc_addr =3D tx_desc", i.e. before the
> buffers for that slot have necessarily all been mapped successfully.
> If emac_tx_map_frag() then fails on a later fragment, the err_free_skb
> path calls emac_free_tx_buf() to unmap and drop the skb, but leaves
> the already-written descriptor memory untouched, and tx_ring->head is
> never advanced past old_head (the "tx_ring->head =3D head" store is
> skipped by the goto).
>
> So a slot between old_head and the rolled-back head can be left with
> TX_DESC_0_OWN set and buffer_addr_{1,2} pointing at DMA mappings that
> emac_free_tx_buf() just tore down, while software considers that slot
> free again. The next successful emac_tx_mem_map() call only rebuilds
> old_head itself; if the DMA engine auto-advances into the following
> descriptor once it finishes old_head's packet, it will fetch that
> stale, already-unmapped address.
>
> emac_tx_clean_desc() already treats emac_free_tx_buf() and clearing
> the descriptor as a pair when reclaiming completed descriptors; do
> the same in the mapping failure path.
>
> Fixes: bfec6d7f2001 ("net: spacemit: Add K1 Ethernet MAC")
> Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--8db083407c1172cd2c3ba6047b5480e3683357a2fb171ccebc9ea7e618e4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarE4aA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvPdQA/ioqCUd+mMep/heePmg5POSbHw82i4VRu6knBx0i
8jH8AQDj75L3k8wrRYCpPUky/Qvp1psGOvf7SoMGSkxnf3IVBQ==
=ZUei
-----END PGP SIGNATURE-----

--8db083407c1172cd2c3ba6047b5480e3683357a2fb171ccebc9ea7e618e4--
