Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CED31A041
	for <spacemit@lists.linux.dev>; Fri, 14 Nov 2025 13:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127257; cv=none; b=hOmQEkei2FgJMUkuyYiW3qcuPxFiscoRE7BlX2GbJnbABT2FdatLaz3xUs6po63FnyL0VwhFxOZAeRuQfsUq3CUcHjW0kHgJYJYfaGD4TQgCUVxMAfOpAI9OXJcD0NEh9SgjHtnbqd/xUG/y03d08unfZVgxc9ZkjHDfVbPepaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127257; c=relaxed/simple;
	bh=u0vSP2aT4zROWHCspOlGTqU/6qNRdjRrooM1LlWGfPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMA5G925TIhuyAgIJdHPU+3Ntt8uDMkQdZtMDfrY9JNA8aD1EzPR7kHYPxkdVpoxr2HoYaY/YOPCjoCmE1NHUcIztJPYh4k90WEPhr520DFcz+DIyGLZgwT85qhghsRmChsXMqFRVCpTOa50EtqrwOGbUuX67eVSPWsbLIjqITI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ctJA5eKg; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ctJA5eKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763127173;
	bh=4vsQ9a4sfdto53Iz7h22ctWn2ltPYXiwp6/cuN4SgYs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ctJA5eKg+sTiWKxF8cv0uNZVqXCV0xhHzwxpZV6V1hV1qXPCMgj2Hpx69Q+yqLsgt
	 3u4LBqo9a+q6jYaSSZKqHGFj3Z0LT/N+LByoQ0mmrVGkC2B+6qSl6a+m5Z/FhLoDEH
	 Rxcwz0U/CbDSDiBciCB7F3PoNeH2lvwVn6lJAIGs=
X-QQ-mid: esmtpgz15t1763127165t49f36372
X-QQ-Originating-IP: upTtG89dUR6BITyX4XCOKRP3GVJT7+Owo5qsvFsfV5k=
Received: from = ( [112.92.71.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Nov 2025 21:32:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2566697099854471615
EX-QQ-RecipientCnt: 11
Date: Fri, 14 Nov 2025 21:32:44 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Troy Mitchell <troymitchell988@gmail.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: fix detect issue
Message-ID: <ABF94A5EDD24501D+aRcvfFgny7UqgLZ6@troy-wujie14pro-arch>
References: <20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com>
 <5b1fd3ee-474f-48b7-8709-d07000a9a113@rootcommit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b1fd3ee-474f-48b7-8709-d07000a9a113@rootcommit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Myi7noze6Y4xnUZa/0lS8FZRIQVlwhxbYlc0fZSgTrgDyFjAqHKqpKkg
	ddiVENpt4JwzpqO4DF+nwYJq+MUWfOeDctBsnUHtTQu27QtYd0bbkjmVrZqxJ/zxyoEyTJT
	ecRhs0L07JYsaYGGNuEd1zt+0AmPi6LZin7cs9WhmA4wzo0CtPbyc3iRLDKiLlLW+uhqZy0
	THLIjGMOw1usVbqPXVNqMTBFn9dBgQf9MGfpllG+IVkjKKbbeJVURrbujuyszYafpkNdU5V
	ktfRb29zcZZwxzoj/GaK6GRHZ9Vz1fHsWcY0F6pDbOKtPCErhzIiHIQY+/7ANu6M+GU2fRz
	oer/cKbeZBxZIfz7X1OIsblMKpAWD+PO4ZZazP9lHJZdTHOwPkmXjxWtoBw2VO9PcK7p4+G
	PWrIEce0QdeYcOKTxFRd0jvDQq7+MIVugIYWBOlmindL3S8SmRNDpPrjcJ8QLNQwrpuU4DM
	V2riIqrGDxZsE7LSA3PeCW7cqKmaSozE+5rhHDGZDq6MqG0dioKYLf+RbLPqv+lOoEeMS5A
	2dWBMwtzGEeQM/dSZApnAyJ56zUUsTxAB2nr6LqsvTvwderwx5wRofBkrROfA7Gx+0eb33T
	YHmaX7QvtTj55fmeU9ioVV9KoJ2yOvARH4f65cqbzjvbEN+gIdCCZtdSJCRoZyMbFICEDwH
	+heTer339Po86HhGJVB/pJqEc/8wsCh3dsZxlRLy86wOFMeI1YvQG6ZAhx63IvbtvzNy2/9
	gIElw2zp0ZZMcRME9yFe8/giWbU8gYPs2HdmGVnmkNvQgB8O9ZYuHorJtRSw0wI5BOVNl/f
	bH/p3a+zvUMruE5TZMCf2jWL9W+eilRDgV2A8tI176J3thNgsu4o7Cak28KEzEx3nL9GKfl
	e2V5LzrvNa9wdbCrODSfqIUKBgpVxi+8LC9EsZhBXmUPluCENlzTnEdalqnaRadH+eGlzJx
	Lpb7znl2+US2GNPyC6CYSnSdLkCqBhfKDiAuV+bd4l+hE8x163h1NDYEaS8XQXB1z9c2aiy
	YHyBC1HNviFzxHshvMkjG7PvNDL4cvoKsry/gEJsPi4ErCkqzN4M51ro+4CQuUGEohgSh3K
	ihC6c+ugHMlBo4Zy/ymtjwJIxz9BdPPUyxCVT8EAOvN
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

Hi Michael,
On Thu, Nov 13, 2025 at 03:37:32PM +0000, Michael Opdenacker wrote:
> Tested successfully on OrangePi RV2.
Thanks for your test on RV2!

              - Troy
> 
> Tested-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>

> Thanks again
> Michael.
> 
> -- 
> Michael Opdenacker
> Root Commit
> Yocto Project and OpenEmbedded Training course - Learn by doing:
> https://rootcommit.com/training/yocto/
> 
> 
