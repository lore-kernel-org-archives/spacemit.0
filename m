Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373A9331A77
	for <spacemit@lists.linux.dev>; Tue, 21 Jul 2026 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784634746; cv=none; b=RvvODdYQ30ChO2aB92Cq4TLUHrx+yX3/alfJUFtMT+z7IM6KrFjSvqwEsnFdDJXSUq/xIEWxVk8X6ztBSmlJ/579/e40TrC/RzVTboS9j8PosR7MxKxoDIs3ObOvWXQI4aituZ1Vsw4D7IMxq1bmQ4+wS1kVv/+QE3dv5bD8rFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784634746; c=relaxed/simple;
	bh=jfeNo9sY+CV+61r2cYiAL9DDVOqrE8w2PYAqnuzcsKI=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version:Content-Disposition; b=uZ0uuTfNA+YnO6jVnkeanNUucf6RG2i2gu5pckXXdR8Mtlu7h9WW10wOZwPIs5jAhZnMB9shIFLDm5sxXykpDWwnJFRQAVAoLRnIfG63045ST11M6eH1UvxNz9PBbvo9d4Qh4ba2cdG4Y91hhnS+Cp34zH+GPCi6IOkYdSJEhYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q26gUfo1; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q26gUfo1"
Content-Type: text/plain; charset=UTF-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784634742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saPQNRXNr4uVjroUD0Lw5F38mIc84uTGGZFC3b1RqYo=;
	b=Q26gUfo1WQCFaXMCnKGGdL3LL9K4urpBsFjjlc8rJ2iknWOPf2bp22QYMRWaK19H8IrSso
	LI2cvDmA01yHI79tJaqXq5/a5/BHbimUbvxgO+l1+pDDVG95y9Sf5BHpuTZt5NDRn6Aefp
	D8N83wAXa7XK81tCXohhDc7Q4E/9C50=
Date: Tue, 21 Jul 2026 04:52:12 -0700
Message-Id: <DK487PYQKFZK.HX96HW3B22XZ@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-4-ef5fb342872a@linux.dev>
	<20260721100004.D93AC1F000E9@smtp.kernel.org>
In-Reply-To: <20260721100004.D93AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mutt-References: <20260721100004.D93AC1F000E9@smtp.kernel.org>
X-Mutt-Fcc: =Sent
X-Migadu-Flow: FLOW_OUT

On Tue, Jul 21, 2026 at 10:00:04AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Will this corrupt the temperature reading if the I2C read fails?
>
> In lm63_update_device(), if i2c_smbus_read_byte_data() for the LSB returns
> a negative error code (such as -EIO), it gets bitwise-ORed with the shifted
> MSB. The negative s32 error code would sign-extend, overwriting the MSB
> bits entirely and resulting in a large negative temperature spike instead
> of propagating the error or maintaining the previous valid reading.
>
> Could we check the return value of i2c_smbus_read_byte_data() before
> merging it into temp1_input and temp1_max?

Good catch. A failed read must not be combined with the other temperature
byte. I will read both bytes into temporary integers, check both return
values, and update the cached 12-bit value only after both reads succeed.

The existing lm63_update_device() also truncates or combines unchecked
i2c_smbus_read_byte_data() results in several other paths. I will address
those existing error-handling issues in a separate patch, rather than mix
that broader change into the CTF2301 support patch.

                                            - Troy
