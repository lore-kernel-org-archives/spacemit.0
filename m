Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425954;
	b=4huntqKUImJoEDt3VPB6olziTDcubdgXdhvEtj2NSaNK1PLQ2H9quB+3El96X2gHoJNR
	 H45nTMG/HMVUiEBssYB7ccEtZg8hgQ+SREHlHg3Bii7z/oJhYWHpg9GptccoDo4lUW+Lr
	 LwPL3bbA8KP3LgtpAVKmRB333mZoQ4ZlP61dpGEmwKwxbJ8LrNuauyu/jflCkUqtdOlhY
	 qKpfWyPtrb8EcPcGcG15ajtnewSLwV3JAFZnhfu5YNZzO+0QIL+bBb+p+jrybgtzpZgs5
	 gC4UWIGh1FqgXxq+/YP1Ve3NuMF2yBUVkBADROrfI5S3yj2VzY5jcCAcdeHU2EFreZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425954;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 Content-Transfer-Encoding:In-Reply-To:References:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=JBgmFwI3d+bD4ZeA1f4oLGcqRjnONiXOuExZb/PYGVU=;
	b=3WVjivetDCD5UNaZgN0iH8piEV/8brgNPU14ADg34LeLTUUjMU1pKOXaN7jEsTGj1On/
	 g21UEDtEJMy3adsc4Sq2BzrrQozKoRsTd6KzSZhHlbDYg66E37w2oWIeRJ2IMXGTRyJTe
	 ft40MfC6klbtzFAq2K0Bw0ivo3ZojTIEHbtuF2/PASs6pURU2A9lqOf5CwiYp7wADGtFE
	 /K5rcknSeqDVzgFswpcl6OQYNls0hKADrrO0rhV2FB/FO+Z3hwlOal6P8Rwz6v5CxvaCK
	 ReDlmvCCsM0wars7Ri7JSvbXndhNUYI2M+dlmal3W6OnJtJFKFbHhFq4vPSq00uWDXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=bpRmjo+T;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A50C606A31F
	for <spacemit@lists.linux.dev>; Mon, 23 Nov 2026 09:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A50C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=bpRmjo+T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795425902;
	bh=JBgmFwI3d+bD4ZeA1f4oLGcqRjnONiXOuExZb/PYGVU=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=bpRmjo+TJx+EXAXz2i836hOhcde9JmnBTLwhD0g1BaaFKQNTrON1PGAQwc3yRdzrm
	 41bmzeSSsrcjx6NQa68swL7yBgkHVHMg+hWf1STDN+vB8C7Mk98uEOC4QJIHRKDLWy
	 S1Pi6ko6FisVuT8IZteniiOgdPEWLZ1ty8DsBpLc=
X-QQ-mid: esmtpsz10t1795425896tea819c39
X-QQ-Originating-IP: uO/dN4xpVqcgehUM7VHVJuhKXoP0Sa6dV1wDnAUdss0=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 17:24:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6983506776198614728
EX-QQ-RecipientCnt: 18
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d2ee13a6a85992f018305a6f724e47d00c2db0323c1bf1b05267470c5e8a;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 23 Nov 2026 09:24:52 +0000
Message-Id: <DN2HD0L9B12P.2EK0R922TOV3U@linux.spacemit.com>
Cc: <srini@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dlan@kernel.org>,
 <troy.mitchell@linux.spacemit.com>, <me@ziyao.cc>, <aurelien@aurel32.net>,
 <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Jiayu Du" <duge1256@gmail.com>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261122173810.2409146-3-duge1256@gmail.com>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MEc+ZvFxT3Id0mAMkmwJzZjB6ZNyp0/aYoFf2CjA8h2Ltgc8qHtV+DEz
	5bcTeMx4e4O3r7ZxURvIvVt4LoL3UdHpShdjxlg5uiK8zRcretqGgTQGYP0LzK7AW168M/n
	faT8uAseSChacGFN5G6/+5TMtHzzlPGABmg8y/OqJLS6yDasxfFu4LJjN1FEKucamEtgZct
	bWlLUQTi5jr93gYFhvQzdq4c1C7b5fgEezVkC4GVI3enZFmhdOBwAR8lSxZ0Gd4yOsGW5cU
	LhWOR2iwdhFbs3qqSON6uhaYS1liM2bsV2w9v/iId8tbCT2rcQyD21S8EU6qezXXh/AgOno
	Pba8S9KCPMkI1kBxnLCyXOtBhs2wz7xvjEbtTfPmyKvWrUlZfNsABRc+M+uZqvVRUmbaelO
	6ydr5lYoriIy7AUP2+eX+M7Mg8wx94d5oWrapWtf1vaxyHx3KjuIXFDu+JTX/lSkVS6xxjn
	/OGF8MMCN/kXoS0SCjbBL4pyLfTy9sgjTXszerguHYQfNVUZyH5pU+oAASzwdJMgtcJN/DH
	STY/0Jk9ppMC8ukeKlikhYME3wb+TIk4Dsj1dPQjqP/C8VapPtUskc1BLJYFmtqxq4KMbaD
	UlPoJ7qvJUjfAcdrmJswcLKL7+7OVaL470oba763476UOt2YjGV9IvpYItUPcpbh56aeOXh
	2JYioBhVQwz0luyo09qZa+auJOsA2LAYWZ8VQy9bHHr8Cxa1SS3jyopBg4EljVj2nqG8S17
	IF2sF8fTdhhHFiUlE0aTJdMtc3P9t7Axyf8NyuIKswUYiO1Q6NyQs+UrtDbhu2xZuiB2Y8d
	/hRo0UvgOWfQ3nM5+NVPuRIStmMcINRch9ouwYg1QVW+D7463iiehIVbV06ft/dyLXkf88m
	m1DauE0J94WwfQvKX1sfALa0iRhAbyTs7lh3gglA3QRls695C7GT2qoZnnbHuYsV/bmZhrW
	QNKmXQcHSmKrD70GWi09bOhf7n+p9VIzWXStZj/HfXan8kUbM3lW5pgvScy1dShrgN3VY7B
	pMzl5Ov5y+sP3xes3hRAht0Xlz1viQ4nOlnOabCkgjd1lE8Q0SgbNPrhYMpcldEly2s0out
	rBNPyXu9huv
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

--d2ee13a6a85992f018305a6f724e47d00c2db0323c1bf1b05267470c5e8a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, 23 Nov 2026 01:38:09 +0800, Jiayu Du wrote:
> Reload the shadows during probe and cache the data for subsequent reads.
> Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> other banks.

v2 said why only banks 0 and 7 are exposed, here and in a comment
above k3_efuse_keepouts. v3 drops both. Banks 1 and 2 hold the root
key and the SSK, so please keep that explanation.

[...]
>
> +static const struct nvmem_keepout k3_efuse_keepouts[] =3D {

The comment belongs here.

--=20
Troy Mitchell

--d2ee13a6a85992f018305a6f724e47d00c2db0323c1bf1b05267470c5e8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawQGZCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8cbgEAyeUFitMIdIlR
gQa3GssF970F0URLGWsxfc3ds7zjEf0BAOJNKKuprXjtRVCBte1FETP5UaTR1Gb3
jxY5BVbWXI0P
=GIiJ
-----END PGP SIGNATURE-----

--d2ee13a6a85992f018305a6f724e47d00c2db0323c1bf1b05267470c5e8a--
