select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v3, 0) + 13 as v1,
    p.v3 + p.v1 as v2,
    p.v3 + 13 as v3,
    round(p.v1 / 13.0, 4) as v4,
    round(p.v4 / 11.0, 4) as v5,
    p.v3 + 13 as v6
from {{ ref('int_ev_0012') }} as p
