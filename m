Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253F32C933
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 18:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767118004; cv=none; b=e3lqTNdd41pxM7LhJ2kD6HydB7mGYTpZ2vkWcgYsZWbgAOuC1Il/k360ewMjoZ8XBpP6svQz96vgIeYFFNMjHl1RLrHrTfIrRdlaPvolpDbLTZ/CDQQbSUSE6PfoDa93I99wdNFKda3E4/itjru7juL3wG/lncGboA2Ll/nk0Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767118004; c=relaxed/simple;
	bh=NVJUvkx71xFKaq/BSEtekH0aZkiHJKOEY4q0BFJIAW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sda7+w0SXMia4fOeQ7anWDmjOwaIOEcLwHv0fmFdnXXj5b1j73Yrd+hkTKPxh2o1xdDWU7IioWUl6qg8U/CH3h91hbGhZN+DCZzs5wqoRaQqYjVk5JjnA+6VRbRTnZ0Sd7CyDtfvW36Jaid3T5jP1EOM1YC9znwTmT2Mpe1ZElE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TLuUVpMb; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TLuUVpMb"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88a35a00506so102668926d6.2
        for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 10:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767118001; x=1767722801; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4yVj/w5JDZnyERJYSMulDshPdYjkZAshZuWaOUGklxI=;
        b=TLuUVpMbYZz6Uq4ec+DJCaTdbB/07tAF2MwHf5BUTrImAvl+FMpXMda8BwiCTQQXt5
         K3zu56hkvAbl8BQ5BgNtMJxWkhtUjo5cod+HxBhrefzwG7Ibqtabd8rrLnojrchDnhKO
         qhhQnBlMaWDIAKLWhWND/khI3FJTiff4eN8lloEqWbFj2ciiudniyBHGDIX9JqEu/YNR
         /NPZjGBizum1uzepMvHRO/W+EgVreLmIdrMdky3atg3eSQJSOWKSHGz2WC+srFzjOUTU
         otZJwrSict/Z7j5km6i8xjka7eQpHpyY+WwK6YShw0JuQpVBTIXL5RhvRXvy5SbC2nO6
         Supw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767118001; x=1767722801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yVj/w5JDZnyERJYSMulDshPdYjkZAshZuWaOUGklxI=;
        b=m9SH+kdVgUh2cTnnParNlXWSAVDoUUkawZWMomqL9MGkQaJpSriZiZ4xWadxNSHQ3P
         6Spx7S5REiK7TVJ9MJ44NiINRwd+RCvdhLoQToGdfEmaFcas8B6+lTH9DiQ43U9jiFEu
         gVLL/Qp5TAs2FJpxxAbCOAR4Dil4dma8Bv8EJ8E1FuVkosmgowTiSyGVzZzBqvHhFu/H
         oJuqs/FfMwr1/s1/XvJY/FGbz1rmNJypQX9YVERljJpKgrJTDA7XWhe0XYcORJV0DMRg
         QCXIQw8F5z/0TUSoiMm+1mNatRl0bZcua0Oi1loJ9o61AY9sj3oWfnxfxSpA/q0iffiF
         ZYxw==
X-Forwarded-Encrypted: i=1; AJvYcCUj7qxjww2LfXE61RJlT7M0rlDQL2GMnRJH3QS978nee1ZjtYMcfFiKbe+QLSniLlFszotEliwC+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNN9w9qv8g7BXM7I49oA4mT+If5T1B48Qo7ben/rgB878jJsKC
	xmvp+56H06J2D0J9MrxXOgF+TofuAdq3/7dYpMIyLFuCa0refOgRuRIEhmEcZV+kWhY=
X-Gm-Gg: AY/fxX4aEA0ybc5N/f3hVMWNZaWZZEfESDy78PfUuEImyor9V0ZB2eDP0cxFqe2sjks
	+2iTpvGjjFbO1ukU/aEL96hpaizq8fRTbJeDJNfWQvFh1GUcCGnqKnKsfyvBEI68IDFPXHK3M2S
	TaWQRsDKI5Mfj/s/Knr3wx4W/Da7FXziOavwFY2Fv9+XOgfDImtOCeS7R5uk3P95LThUu0hW+co
	7trRPe0gQkHdR7IKR0+p/G45iuDegEU/imt0gFk77tEeTNBBYFEZG9haA3RnvvHbEcCYCZcP2wt
	2vXaxHZ7jXfjijCLw49TRCxepRChJ8r9Ek1rdVW4HlC9fR9e3RdPnlhs/4rGHv/nCrVBU183Px6
	K1hE1+Rlr7WCe35xmjFs5TMTD0VtAC3qswE0kmFL0MB2AvAT1nW9GrgDIagj2nuK+UaZFtgv6Qt
	wMxYvsAEpIxECFV8LOYDZfTvygAFUHENELf9eNbWiiM77evxSgy0U=
X-Google-Smtp-Source: AGHT+IGutbAgelJ7VpLiqCRVpc5Qslt27XYYdm9lZscZshp31OHqvrlSlOewiedfwdLZdpnsi4JpGQ==
X-Received: by 2002:a05:6214:5b85:b0:88f:e9f0:77b9 with SMTP id 6a1803df08f44-88fe9f07bd7mr289091346d6.58.1767118001338;
        Tue, 30 Dec 2025 10:06:41 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7e8d4sm261620256d6.41.2025.12.30.10.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 10:06:41 -0800 (PST)
Message-ID: <13ac4110-5ef9-4469-9fcc-4168479758dc@riscstar.com>
Date: Tue, 30 Dec 2025 12:06:37 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] dt-bindings: riscv: Add Supm extension
 description
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Yangyu Chen <cyy@cyyself.name>, Paul Walmsley <paul.walmsley@sifive.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, linux-serial@vger.kernel.org
References: <20251222-k3-basic-dt-v2-0-3af3f3cd0f8a@riscstar.com>
 <20251222-k3-basic-dt-v2-11-3af3f3cd0f8a@riscstar.com>
 <fc719e92-10bc-455f-b402-c93bdbf878cf@riscstar.com>
 <20251230021306.GA3094273-robh@kernel.org>
 <20251230-outing-discourse-723547cc14da@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251230-outing-discourse-723547cc14da@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/25 11:22 AM, Conor Dooley wrote:
> On Mon, Dec 29, 2025 at 08:13:06PM -0600, Rob Herring wrote:
>> On Fri, Dec 26, 2025 at 03:28:47PM -0600, Alex Elder wrote:
>>> On 12/22/25 7:04 AM, Guodong Xu wrote:
>>>> Add description for the Supm extension. Supm indicates support for pointer
>>>> masking in user mode. Supm is mandatory for RVA23S64.
>>>>
>>>> The Supm extension is ratified in commit d70011dde6c2 ("Update to ratified
>>>> state") of riscv-j-extension.
>>>>
>>>> Supm depends on either Smnpm or Ssnpm, so add a schema check to enforce
>>>> this dependency.
>>>
>>> I have the same general question on this, about whether it's really
>>> necessary for the DT binding to enforce these requirements.  The
>>> RISC-V specifications are what truly defines their meaning, so I
>>> don't really see why the DT framework should need to enforce them.
>>> (That said, I'm sure there are other cases where DT enforces things
>>> it shouldn't have to.)
>>
>> Does the specification have some way to check it? What happens if a DT
>> is wrong? Are you going to require a DT update to make things right? Or
>> the kernel has to work-around the error? Neither is great. So having
>> this as a schema makes sense to prevent either scenario.
> 
> The reason this whole mess exists is because extensions got redefined
> after the kernel port was merged and the bindings defined. This is

Redefined, or just new extensions defined?

Was support for any extensions added to the kernel before they were
ratified?  Even if so, did the meaning of the extension change
between when support was added to the kernel and ratification?

> almost all a hedge against there being future redefinitions. For now,
> and hopefully forever, this will just be a list of extensions with
> citations to their relevant documentation so that we can say "this is

Yes, this is good.  I think the bindings should, where possible,
just refer to the precise definitions in the (ratified) RISC-V
specifications.  But I now agree that they can also encode
logic to enforce things.

> exactly what this means". The added bonus is avoiding messes like people
> implementing development versions of specs and claiming support, because
> that just becomes "your devicetree is wrong".
> 
> The dependency stuff exists because it is far too easy to miss something
> in a list of 30+ extensions and dt validation can reduce some of the
> complexity required when checking what extensions are supported.

By "dependency stuff" do you just mean the DT binding logic?

Anyway I've come around to the idea that DT bindings actually
should do validation like this.

>>> And now, having looked at these added binding definitions (in patches
>>> 07 through 11 in this series), I wonder what exactly is required for
>>> them to be accepted.  For the most part these seem to just be defining
>>> how the extensions specified for RISC-V are to be expressed in
>>> DT files.  It seems to be a fairly straightforward copy from the
>>> ratified specification(s) to the YAML format.
>>>
>>> Who need to sign off on it?  Conor?  Paul?  DT maintainers?
>>
>> I generally leave this extension mess to Conor.
> 
> And generally I do without that much back and forth, just so happens
> that a couple of the ones in this series are the less simple cases to
> deal with.

Thanks.  I may have a remaining question or two for you but they aren't
that pressing.

					-Alex
