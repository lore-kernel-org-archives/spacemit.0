Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A317732D0FA
	for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 18:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767118007; cv=none; b=DuOtzIS3f1/1T1ve5QX+E2PpUSrrJmgu/uifhzf8+k50JZ10DaycdObFbuieQ8v5xgPNgdyEKsKakkqnDUNCyrisNXbPY9WJIBpD3dn+c0A8zC+YSrYFpH+FaHJ6QCSy6MWk99tPXJevRb7qLxjRA7Hj9+SjhwMPSoKsEMfRryE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767118007; c=relaxed/simple;
	bh=JXbcTwt8lSz38JLo5VyeeND1Py4MQ5lVYu2xY2r+7wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WzTh+/ZJV9v/vK5kSa1l29dkMnMc8lAiq+xSsjHFqIn2XHWBRtFzU+46T2og8JXjClU9DSV+oj53A8H7GRBP8zXBY5ml+MG6PtNpOanLyMgbhsj9Wk21ee72uTFr8Gzp3igG7Db4zGnYKzYxlLFs+gF7qzhpL+WcdBP7YXLzyTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=v//R+7yC; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="v//R+7yC"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88a379ca088so117163956d6.0
        for <spacemit@lists.linux.dev>; Tue, 30 Dec 2025 10:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767118005; x=1767722805; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kw6K1zDOG7+9A9tzeUA0t/hpBL/fZjOT2o6xij6Wc/E=;
        b=v//R+7yCBqs+gGaw8KGSiQMPGIwhJX8WgMsa2p9dhrzGOmqjnzryBmzSEKc4C1Kpk1
         TQ/c4R9H6sH/QY3mejVikedzCO86Mev54mxQsxMyCq41Fy9figaycLdPQztv+jSBsY65
         FuC/HfEIF8Y+mEmx7KMLK/Ay9Sh6Y+dieKiBZeJ2Urpk8QJVaIgU6Ak2RzG2y5DTMQtV
         i4QgDy4S0o3xItW0h77WIPfjAah+qPXneOmKbfkRUWnLcSlWA4JtPUl/vxRhIWYd5Xlw
         QtLl/v+n+XvmhuOmKJzaB9qfl41is4ruivScrgVhJUl4QNBoRrDL6vmcAM0QHXnDV84k
         JUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767118005; x=1767722805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kw6K1zDOG7+9A9tzeUA0t/hpBL/fZjOT2o6xij6Wc/E=;
        b=SSvxhbHSoW7pjgAnRBDMbfoVbUkB4o6EvzD6P0UWNiunt55aGrSnkyM31BRsS0AtsA
         tBwyWmLzsyTGvhcwigD2vBJhP8JdD7fwY90M/prQ08k6VZJlt+4YY3k81F0ustnuChgi
         xSA8O5m2cQMau6kq/8UY9B/BmAbyBFT6o8v4OdLfMSJMFQmkPbiV/GHGibsKUS1Gl4YO
         zKYX63BPVxzjNJHcEMklft4KN4EeemIKWuRD5xOAOT4dbTGTqvMlMSEvNK2MLcPOKhEF
         Nw1f28TjhQsBVRzgZ5JNZ+s9yUg/W7uX5sohRIF3Fy6KR80ZhJ8V16JdWUWgOYErJ4VH
         A5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWle9ByTuKGUZkK1fQu9NB4YQDM+kP1tHbBZmGmoCjq51PJu73htKKoG7CxS6BClz2jxOv5vOpaKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo24tfxkBfREW+5toHw8upUfO2bn/kHh67mhuQLMPnUQ1TkAYj
	qeq26lkKn/7OG+r3fhn/buq2Yd3EMSmgud7J4v110esGIxb3vhQjkc6jKHj2zn/Uyo0=
X-Gm-Gg: AY/fxX5LRNaT37PjqNn7x2ry+tI1Ieg+7QqmXq19Bg/6bX5YONmC9JXdiwiHDoZ5ipv
	0co36U50eC9TrO+QD8yLU+ZNKQRiVWhVZ3CxD26glNd1RjFb5o0Hp+c+WjcpxJNX2JVCVfnGxbf
	zcmWlkNixogskjtx0PpVaKcLUuaLOJ0Df7hw2p/TpfTTtYN4ajq4zgh/Dm69GhGZNv1maWzpbmn
	rSwSMApK1Qo1QDOEFMK/XSa9YU/W2/20y1tdKvweUkU/9XSbK3/qFe73Nxi4Kfs8MPqpChZSUQJ
	WmvvCKc9PsnE0ApimFFPkX+3s4vwVBhFNhClKn6yJmCLmp49UBjtvDr+gYVywvPZW+xqU3wYYAp
	ZQo7mEGh0rC8H4IeNaYHVFh6k3RMME1Ec5Z2EX+TNSDAIAH6MpTe5OIHoPfAy1LjNLet11OUk6r
	hjNuo++y69kC8OWoHePTyy7Xu7gvqallRjWZgmkms/OrC1+bBRcaA=
X-Google-Smtp-Source: AGHT+IH9R9RdQs+4+/paw7zFCFKKDDzjpBdbtJmraB11OzlyUV7KUFzWKn/pZTATXFnVWVQr0NrhUQ==
X-Received: by 2002:a05:6214:4308:b0:88a:2f0f:c173 with SMTP id 6a1803df08f44-88d86e482c0mr506484426d6.68.1767118004593;
        Tue, 30 Dec 2025 10:06:44 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7e8d4sm261620256d6.41.2025.12.30.10.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 10:06:44 -0800 (PST)
Message-ID: <55c2c0e2-2213-4cc9-a752-fce17149bc35@riscstar.com>
Date: Tue, 30 Dec 2025 12:06:39 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] dt-bindings: riscv: Add B ISA extension
 description
To: Conor Dooley <conor@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, Rob Herring <robh@kernel.org>,
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
 <20251230-imprison-sleet-6b5a1e26d34b@spud>
 <dc87a3c0-8627-4328-a17a-6510ee8245ac@riscstar.com>
 <20251230-ungloved-unworthy-cacc7e22e1c7@spud>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251230-ungloved-unworthy-cacc7e22e1c7@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/30/25 11:46 AM, Conor Dooley wrote:
> On Tue, Dec 30, 2025 at 11:29:14AM -0600, Alex Elder wrote:
>> On 12/30/25 11:09 AM, Conor Dooley wrote:
>>> On Fri, Dec 26, 2025 at 03:28:25PM -0600, Alex Elder wrote:
>>>> On 12/23/25 12:51 AM, Guodong Xu wrote:
>>>>> Hi, Conor
>>>>>
>>>>> On Tue, Dec 23, 2025 at 5:17 AM Conor Dooley <conor@kernel.org> wrote:
>>>>>>
>>>>>> On Mon, Dec 22, 2025 at 09:04:17PM +0800, Guodong Xu wrote:
>>>>>>> Add description of the single-letter "B" extennsion for Bit Manipulation.
>>>>>>> B is mandatory for RVA23U64.
>>>>>>>
>>>>>>> The B extension is ratified in the 20240411 version of the unprivileged
>>>>>>> ISA specification. According to the ratified spec, "the B standard
>>>>>>> extension comprises instructions provided by the Zba, Zbb, and Zbs
>>>>>>> extensions.
>>>>>>>
>>>>>>> Hence add a schema check rule to enforce that B implies Zba, Zbb and Zbs.
>>>>>>>
>>>>>>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>>>>>>> ---

. . .

>>> The dependency can be go both ways, to also make specifying "b" mandatory
>>> when the three components are. That probably produces the most helpful
>>> devicetree ultimately.
>>
>> What about DT files that specified zba+zbb+zbs before "b" was
>> ratified?
> 
> They'd generate a warning, which can then be fixed. That's fine to do, a
> warning in linux-next doesn't harm anyone. Updating devicetrees in ways
> that don't change their meaning but provide extra value is not a problem
> in my book.

OK.

. . .

>> But why even bother supporting "b" if you have to *also*
>> support "zba+zbb+zbs" if you use it?  It adds the possibility
>> of new errors ("b" without "zbs", for example), while not
>> really enabling or representing anything new.
> 
> That was my first question after all! Ultimately I'd really err on the
> side of adding it because people will expect to be able to use it and
> because, in terms of kernel support, it will be useful for ACPI systems.

I think it's too bad these "equivalent" extensions can't be used
to simplify things.

I really dislike requiring the both a simpler extension *and*
the others that it represents/implies.

But practically speaking you're probably right.  People will
expect to be able to use them.  DT tools will then point out
what's missing, and the list of extensions supported by a
given CPU will just grow and grow and grow.

					-Alex
