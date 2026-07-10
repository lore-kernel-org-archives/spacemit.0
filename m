Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAC33B893A
	for <spacemit@lists.linux.dev>; Fri, 10 Jul 2026 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783669659; cv=none; b=uPMo2OlpbUTHUwMct/NjPwjKuMxX4m909It8IDq3ex8babMBz/GyjrX1EGuFNI7kHjsT5AgUEhv3LB1KjT4llncLR3hNr87B9zUkFIjMpvZJ8Gxn/+MNlZXSDTq+fCIMVIBcB7gSa5vdjTKWKblMcCMED0EDQ8AAvJ49HavmKVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783669659; c=relaxed/simple;
	bh=+wmDvXUOXjU3w51MrkzFKTdkvr642NHXKTuppNl2utk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=MtYPcELmYKo7iMK+cTsx/Iy00lVOseiaT/FSJBHfCEHAndTMcr4sgdubWmcZHz1XHQwG8hJxcC/hgDrEIfF+rMTzXCRdPh5sCBLx4ULt6XhXDNEUwRAvEC1RSpd9D0hJE3Omt2aCk10eq3wEeVhct7Uy0EFCgZBRG7gzTepQNIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=j8Nq08LX; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="j8Nq08LX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1783669612;
	bh=tCXiRAidT7Tj7nAkXCfnTb49hXcdDEiTCWUTs+kNLUo=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=j8Nq08LXIV6TVaDubmUXK29U4HVxwln9fqo3XkS9zmXX9X+5rVyuEswSunOzvA9tO
	 j1441FK9x6hBkYB76gVHqdpxa0c6MVQKofKyvEAcOBGzmw1REej+mS5KkupBT+bal0
	 dE3JhJtYWnmyAqA8PetbWafIXfRY3/Q4Ag167uqI=
X-QQ-mid: zesmtpgz6t1783669610t338b78b8
X-QQ-Originating-IP: YluUCLnr0X2nZ+wyyb9bLWlA+yup6sQJAkI8+M0Cx6Y=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Jul 2026 15:46:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9533414370233145081
EX-QQ-RecipientCnt: 7
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 00:46:48 -0700
Message-Id: <DJUQ3TZHM7OO.34ULEC76Z2BDY@linux.spacemit.com>
To: "Pei Xiao" <xiaopei01@kylinos.cn>
Cc: <andi.shyti@kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2] i2c: spacemit: fix spurious IRQ handling returning
 IRQ_HANDLED
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <ef8b623f45d4e430721e46572c2598d882044aed.1783667603.git.xiaopei01@kylinos.cn> <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
In-Reply-To: <ef8b623f45d4e430721e46572c2598d882044aed.1783667875.git.xiaopei01@kylinos.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MShfLn39PbN210RO2GkaNDp9CEg6r6/ziGbx/Trz3CwI6xcQ5pRryhTn
	EuUB0/aAQvxGtzYs4+EmJz4SX1/cYtOLbb0AmWfAs6rD+ZR6HNnautCuPTIrnJkTTXLVg4q
	lIk4FGxuvNgc8P07OmI9wJLwmWexF59uX7jr/A47If4sMMy81L/e0C67qJUFt9V8+O4JTfO
	u3V4JGRdKzH/fxkPuj0vHytIWO6Vh61HhyYJtOfGn4KCj2HLt9QiNmMUIyHbI3ArWYX6yo2
	UGeVv4TtoR2W4YYZ5OfODi3JQGx3Y8/CaoaVUjAe87zYEczpqG0/aNBG6+h7DNYu/aUU+9E
	vWOms5EyY6gf75fG3wn57+iR7AfeoH8Lhc3wEpDrgBxU3RUef4cQlQVMBqBJQ0neKCCzetG
	UlDzZ+wHUNQVmnecc4fIg6l/CDJ7WYSBN5NkPIoSBzdTeoND4Z9/EbQ0SVU0lA/a9wfO949
	+HU3WGasS2D/R3tf99A8U5g+5BjfSHO/GT1eYHFlsvP/RC5bj2Fmv35pzKYe4UE9S3+BTRE
	UAbqrYN3OP0t1nyKLrXueQW/yrsT8RXlomtFwdQprdhuAQbVpy8EWkB6z0/BaWH9gnNPLz/
	DhWhtC9qXa7wmNThT8Kdx4Uh7VUW97ggxpigbp5nHMEpcqgUvU2GelptZ73L28xJwdJxls4
	VDD1QwEowIcPgJitH3njUWuO8yR6sOn2nUA5DsrCq1S7uuJXLgHAhLR/nCjS7ALbM9hbA82
	+7nOnRlghqecVZqKfsBMBIMfSnj646dUqg+ykCkr4DGtVCBG+gamF4oVXqac0/x3lLqRpjG
	FJdGvYKLAW+Y69sZd8FEpmznN5cJbIxCSFJYwsk+VELTcE5EAIJMToxrD5OuEq++YM5w41m
	p+ah/7sYCVldqZ+K2Mb2MoO+WgJvcAe3l//rED8ApeS1zb22Fr5eiWLPWGzLsdX6xEbM1hj
	j2MwGHTHGnV/XrNHNzurZxZLzxPGKfFa8gd6K58LW6+WXgf6/flpviewbrSXzTej1T+zuec
	WU9NFR7SSeGouU9aAoSxIlIum3xuyghNcAZCjtyF+x8lxuGvc3
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

On Fri Jul 10, 2026 at 12:21 AM PDT, Pei Xiao wrote:
> When the interrupt status register reads zero, the handler should
> return IRQ_NONE instead of IRQ_HANDLED. What the return value
> actually feeds into is the spurious interrupt accounting in
> note_interrupt(): falsely claiming IRQ_HANDLED defeats the "irq XX:
> nobody cared" detection, so a stuck interrupt source would never be
> caught.
>
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
The commit message now describes the actual mechanism correctly,
thanks for reworking it:

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

One process note, though: please don't repost new versions this
quickly. v2 followed the review comments almost immediately, which
means other reviewers who were still looking at v1 never got a
chance to chime in before the thread moved on, and the discussion
gets fragmented across versions.

Documentation/process/submitting-patches.rst ("Don't get
discouraged - or impatient") asks submitters to wait a minimum of
one week before reposting; the same courtesy applies to new
versions while review is still ongoing. Collecting all the feedback
on one version and then sending a single respin saves everyone
time.

                                - Troy
