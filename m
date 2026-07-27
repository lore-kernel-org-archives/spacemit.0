Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1F63D3486
	for <spacemit@lists.linux.dev>; Mon, 27 Jul 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785137140; cv=none; b=g4aPMW48FxvgmZ2BhISK2i1NiY41dPxGpwp6mkZZZxmY39V7GFPxr616bZrT92/lFXvM6/S9NvLfveDK8k6upl1JQ7llwKpynEYwjD2aZiovQ0mnjIAA5Cn9kX8Atou5SnP68QIrQtRdw4kLDp8oFePDrGNEHos6uMfx1M7CHSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785137140; c=relaxed/simple;
	bh=J47sKYVXFsDPGrwWVANqosoLCQ0UZXXSniADY9yNIUE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=O1avovaoMw0YPbZk1tjwSF3RoUTqcBirqIs9x0onMmQg5M1XKKBlbBhY7DEf2CfmBCUK1WKXZ035EtDnB9kldZga3wiNXervhUIGDuWAHKsh+60YzGEnMmEyc/Oe9ObFWyObRbuZhfAg8DJqkT6gfsjfpungxlyiyKor699schI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fi90h6ms; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fi90h6ms"
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785137135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hrajy83uZbAEZ4QXrdneOBkHt4WwSHMSLCICN+iSQXA=;
	b=fi90h6msLZL7tSozgaiuR1Ijvk7duvQC8bR42WDPPplaECbDFvk4gHk1r29dC5ZTqXL+46
	+cyULThIQsp41/GbfUkRxxbXkLgchGfexbfb5EVb+KewWpocx4ruS606a5g+UoEWgikZC6
	F+JEFZ+c3Nw7+20SyXYqKVAqwzObms0=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 00:25:28 -0700
Message-Id: <DK96ARC1DRG7.185G42UPDTMCY@linux.dev>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
In-Reply-To: <20260722-devious-seventh-9859bb3741b3@spud>
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
	<20260721-dill-dab-df15585090d2@spud>
	<673be23a-2a84-43b7-9be7-a661cf0e7935@roeck-us.net>
	<20260722-devious-seventh-9859bb3741b3@spud>
X-Migadu-Flow: FLOW_OUT

> On Tue, Jul 21, 2026 at 10:56:36AM -0700, Guenter Roeck wrote:
>> On 7/21/26 08:49, Conor Dooley wrote:
>>> On Tue, Jul 21, 2026 at 02:48:27AM -0700, Troy Mitchell wrote:
>>>> Add the vendor prefix for Sensylink Microelectronics.
>>>>
>>>> [...]
>>>>
>>>> +  "^sensylink,.*":
>>>> +    description: Sensylink Microelectronics Technology Co., Ltd.
>>>
>>> Googling the company to see what their website is, I seem to see a
>>> different name for the company: Shanghai Sensylink Microelectronics Inc=
.
>>> Their website has that with the Shanghai dropped.
>>>
>>> Also, probably the commit message should contain
>>> Link: https://en.sensylink.com/
>>
>> Asking Google search: "Why the two names ? Did they rename themselves at
>> some point ?"
>
> The google search "AI" response was what showed me the different name,
> sounds like I should have questioned it some more!
>
>> [...]
>>
>> I don't know if Linux has a policy about Legal vs. Marketing names.
>> Personally I don't have an opinion. Your call, really.
>
> I don't know what the policy is, or if there is one, but personally I
> wouldn't use the westernised abbreviation since they may decide to rebran=
d
> that etc and the vendor prefix information should remain static.
>
> So this is probably fine as-is, just I'd like to see that link added to
> their website.

Understood. I will keep the current vendor name and add the following link
to the commit message in the next version:

  Link: https://en.sensylink.com/

                                            - Troy
