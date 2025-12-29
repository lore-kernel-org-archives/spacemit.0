Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F8921FF21
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 01:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766971602; cv=none; b=Ee8vXM/tSHC9gAixhC9TPzpe4P8nqBk6j0jZSSuQazhqenINiX0l4cHX1drit//1Hd5TXyCHypqFsfhc4HJXTxU8+uuj6XHl5f72fla0uRz049YV1ar2HKzlL2S0HAGScpssfRA6LWSc+tvA2Fb6wTkWG/2nFoy72mPQ+KtkeYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766971602; c=relaxed/simple;
	bh=6jVZfNQHfE3ib1e3i/fA6aFiwMFZ5z3vI7XwOplm+ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X1lHp6m8zbOCZdZ8GYfRQAr++oIYC6Lslxjdx27YfgibU6Src3yJFNqwrFLbzEgcSgy+zJR+0ZOQYmsQkMflclz+pmjjcbEpV1gqy+NaIRMW4fAWwpMW61uhu90FashOWmvs6XklMcxgVY7sJ44yptccr5f0v5l04EzXtyCjjxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=JmztWsHf; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="JmztWsHf"
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-4eda6a8cc12so97383381cf.0
        for <spacemit@lists.linux.dev>; Sun, 28 Dec 2025 17:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766971600; x=1767576400; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rGBP3a20VsxawgAkzyf8iorKbTSNb1d+2RoMt317030=;
        b=JmztWsHfEZgVpkJ0XRPMuXfnfQGvn5Vkm2Ye1F6H7mWnmwalz/aINfbY4CcgAPGNi3
         UzTd/T/S9M0ls9NVWUo7ehlx85VEsTX4LRWfB3JvIzURCiQfXiaKvTy1sPQL1IoxAS0y
         dKjAhytlmp8qlD2yFTxUSFoef3jybkIP1oTErd6HKHkUG/j/BL+b+GufMU/Ks3UUjbRt
         162k3LeBxLi6fvWcJBgc/FckcURndxIyui3BCLAtWE/5y4jpW5vg123UFaUPCqfBsDhW
         ycIp1EVN9+fwqO77IehbR4x+nIHQNOMEWXuiECWFs0mAS6pQXOmHutqOpLR8BngGHHqL
         Gegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766971600; x=1767576400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGBP3a20VsxawgAkzyf8iorKbTSNb1d+2RoMt317030=;
        b=urEe39zx9MpeXzFCcS+urs1Xfg/dh7m20YD8mAwsD/4s7BhE4qGSb3w+bsvlHhFJl4
         WnYG2SbWa8b3zaMRteJcJYcyFBU+DOJGDZ2rseBJnehXj1OcSxfmcsb2mhuVcQEtshB3
         lt5nTkbdlRg7sZh/0WM7kLBqUBj9f162m7ADjWOlFY87RZb+iJC+XJtI/0FbQ1FT6veY
         IvV1TauMALwoyHjGep82ir9sYQerVwJL8C9zz7KdKiolDFK1qvNg2YF7u1VOuGJOFDSH
         PMsQ+ArQhc1Q0tkbL2dKILYtz6IlT/LCC4zHIo1Hj5RfDXN+AfhEQ3PFbF2YgIhE8Ljj
         7QpA==
X-Forwarded-Encrypted: i=1; AJvYcCX3yURNHmC29jgzyOEqUk6ftg+N6UOMeZ5zBe5kf6pLa3jeDhMj4Wgw8XB31zQu7A2TsJMZPEBrWA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi2W1NZc8dV60Ep6HVnbNNyJjxEPphDQHMR8n0WS8ZtAm3lGSa
	Ps+/r6IdZ0LAwbN50rfF6Ifu+AWo2AjnmshhXjmfa3sTTl7KxLG5W/wuAbw0MPKZCTU=
X-Gm-Gg: AY/fxX7Ohnr9A1pxLTIeQz8vDSmBEiyxO9mGoZInhUEBUuf+UYZGzC239RWSi0+G4z4
	5Wv9PfoJH+4X90ZK559DDtext/qw/qdi/HyLEtsVBt0J7cPVl+fi6ckmO21Kb8gKtW1dvyCCVN9
	+HWQ9H+YGjipej5Y9bCMQgN7O8f+c7Z4TnDCCGajRAQEPTyRjk5e+4CHTh2JS6x5LHcnRsN7jDA
	Sza6r+9seyUCH1cEWQ41VpuMORVsDtZC0JHn7j9hvipI6POfxEtOt0SNUWJe61FhtT73V8drmOb
	fMFmtBpCMdYXicYm+medTWAPgzV3f0ZdWOH3mQ0tDVrD3U0NEjCHZAkord/jeYR/N2K2ppQWJr9
	mU/CvWHBdEOn+joN55k/suljIHlhM7D9W4TZC0mY7bpewhqrgH0+zi4PFuG6FcWHyXs86wO0PTh
	joT9ZEaG2cakz/zRHXkZI1htlWQsPjEwXbs9zZaiTlDOa2E6Gw9lk=
X-Google-Smtp-Source: AGHT+IGEzqpbI6AbapIJlA3Uz+KnswrSFec0YE5rCA81t7vFfgvpfz5067CC+VvdDzEo7yRutO/rPA==
X-Received: by 2002:a05:622a:230d:b0:4f1:e8f1:cbda with SMTP id d75a77b69052e-4f4abd839edmr436267011cf.54.1766971599661;
        Sun, 28 Dec 2025 17:26:39 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac531fa8sm204081481cf.4.2025.12.28.17.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 17:26:39 -0800 (PST)
Message-ID: <ccf5c43c-c7d3-4c89-b578-b40d32dc5b7c@riscstar.com>
Date: Sun, 28 Dec 2025 19:26:36 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
To: Guodong Xu <guodong@riscstar.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
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
 <20251222-k3-basic-dt-v2-7-3af3f3cd0f8a@riscstar.com>
 <20251222-stitch-preachy-3fab87fd6f0f@spud>
 <CAH1PCMZ7ywZ3unLy0yHYK+fFHk0y=q2cEtPnRi=qSpf=fc75rw@mail.gmail.com>
 <66c0676a-7920-4825-b916-3c00b1648a08@riscstar.com>
 <CAH1PCMbBURb=DpChf+Y-DjYjzpXG-pKgoaHAu=TUuG4oVC56cg@mail.gmail.com>
 <5979c8ef-b0fa-40c8-944d-96e226fbcbe8@riscstar.com>
 <CAH1PCMZkQ11-Uk5GnyetLkNLOuO3gs2o0WPWHrFMWVH9R6s8mQ@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAH1PCMZkQ11-Uk5GnyetLkNLOuO3gs2o0WPWHrFMWVH9R6s8mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/28/25 7:08 PM, Guodong Xu wrote:
> On Mon, Dec 29, 2025 at 7:50 AM Alex Elder <elder@riscstar.com> wrote:
>>
>> On 12/27/25 8:51 PM, Guodong Xu wrote:
>>>> That's what I understand it to mean, anyway.
>>>>      https://github.com/riscv/riscv-b
>>>>
>>>> There's no point in supporting "b" in devicetree to represent
>>>> the others if it also requires the others to be present.
>>>>
>>>> I think that, instead, "b", "zba", "zbb", and "zbs" should all
>>>> be allowed.
>>>>
>>>> I might even go further and harden the requirement, saying that
>>>> if you specify "b" you should*not* specify "zba", "zbb", or "zbs".
>>> Historical reasons here. "b" came too late. The chip vendors have published
>>> cores with "zba", "zbb", and "zbs"already.
>>>
>>> That's a migration bridge to require "b" must be listed
>>> together with the other three.
>>
>> Are you saying "b" has already been included with "zba", "zbb", and
>> "zbs" in an existing DTS file?
> 
> 
> The risc-v ratification timeline is:
> "b" was ratified in Apr/2024, which is about 2 years later than its
> components zba/zbb/zbs (these were ratified in Jun/2021).
> 
> I can do this in linux kernel, writing a dts file which contains only "b",
> but no zba/zbb/zbs. The linux kernel can correctly extend "b" to zba/zbb/zbs.
> ps: after I or somebody adds the logic into cpufeature.c.

Yes, this part I understand.  (Yes, do that...)

> However, the problem is with the older software who reuse kernel's DTS files,
> and recognizes only 'zba/zbb/zbs'. (If you search in the riscv/boot/dts,
> you will notice a lot platforms supports zba/zbb/zbs.)
> 
> When there is only "b", these older software may just disable the features
> related to 'zba/zbb/zbs', because when they developed their feature,
> "b" doesn't exist yet.

Yes, old DTS files can and will continue to specify
"zba+zbb+zbs".  But those old DTS files are not expected
to be changed to replace "zba+zbb+zbs" with just "h".

Once "cpufeature.c" supports the "h" extension, the
software supports either one:  "h" or "zba+zbb+zbs".

The key point I'm trying to make is that the binding
should not require "zba+zbb+zbs" to supplied *on top of*
the "h" in the list of CPU extensions.  Only one or the
other should be sufficient.  And I think your binding
was saying "if "h" then required "zba+zbb+zbs".

> Hopefully I explained the logic clear this time.

I think you have done your best.  I hope I'm not just being
dense.

					-Alex

> BR,
> Guodong
> 
>>
>> What I'm suggesting is that (unless someone has already done this in
>> a DTS file), there is no reason to require "b" *and* the other three.
>> You should allow either "b" *or* all of the other three, not both.
>> That would support older platforms as well as newer ones that use
>> the more concise "b" only.
>>
>>                                          -Alex

